#!/usr/bin/env ruby

require "pathname"
require "fileutils"
require "shellwords"
require_relative "lib/common"

class PrepareJscScript
	def main
		if ARGV.length < 1
			throw "missing stage number"
		end

		stage = ARGV.shift

		Dir.chdir(jsc_dir.to_s)

		case stage
		when "clean"
			clean_gen_dir
		when "1"
			make_include_dir
			generate_bytecodes_files
			generate_jsc_builtins
			generate_inspector_json
			generate_inspector_bindings
			generate_injected_script_source
			generate_llint_desired_offsets_h
			generate_keyword_lookup_h
			generate_lut_headers
			generate_regexp_jit_tables_h
			generate_yarr_canonicalize_unicode
		when "2"
			generate_llint_assembly
		end
	end

	def clear_gen_dir
		if jsc_gen_dir.exist?
			jsc_gen_dir.rmtree
		end
		jsc_gen_dir.mkpath
	end

	def make_include_dir
		puts "make_include_dir"
		include_dir = jsc_gen_dir + "include"

		if include_dir.exist?
			include_dir.rmtree
		end

		dir = include_dir + "JavaScriptCore"
		dir.mkpath

		headers = [
			"JSBase.h",
			"JSContextRef.h",
			"JSObjectRef.h",
			"JSStringRef.h",
			"JSValueRef.h",
			"WebKitAvailability.h"
		]

		FileUtils.cp(headers.map{|x| 
			(jsc_dir + "API" + x).to_s 
		}, dir.to_s)

		FileUtils.cp((repo_dir + "src/JavaScriptCore.h").to_s, dir.to_s)

		puts "done"
	end

	def generate_bytecodes_files
		puts "generate_bytecodes_h"

		cmd = [
			"python",
			(jsc_dir + "generate-bytecode-files").to_s,
			"--bytecodes_h",
			(jsc_gen_dir + "Bytecodes.h").to_s,
			"--init_bytecodes_asm",
			(jsc_gen_dir + "InitBytecodes.asm").to_s,
			(jsc_dir + "bytecode/BytecodeList.json").to_s
		].shelljoin
		exec(cmd)

		puts "done"
	end

	def generate_jsc_builtins
		puts "generate_jsc_builtins"

		sources = Pathname.glob("builtins/*.js").map {|x| x.to_s }
		cmd = ([
			"python",
			(jsc_dir + "Scripts/generate-js-builtins.py").to_s,
			"--framework",
			"JavaScriptCore",
			"--output-directory",
			(jsc_gen_dir).to_s,
			"--combined"
		] + sources).shelljoin
		exec(cmd)

		puts "done"
	end

	def generate_inspector_json
		puts "generate_inspector_json"

		inspector_domains = [
			"ApplicationCache.json",
			"CSS.json",
			"Console.json",
			"DOM.json",
			"DOMDebugger.json",
			"DOMStorage.json",
			"Database.json",
			"Debugger.json",
			"GenericTypes.json",
			"Heap.json",
			"Inspector.json",
			"LayerTree.json",
			"Network.json",
			"OverlayTypes.json",
			"Page.json",
			"Runtime.json",
			"ScriptProfiler.json",
			"Timeline.json"
		].map {|x| 
			(jsc_dir + "inspector/protocol" + x).to_s 
		}

		cmd = ([
			"python",
			(jsc_dir + "Scripts/generate-combined-inspector-json.py").to_s
		] + inspector_domains).shelljoin

		cmd_out = (jsc_gen_dir + "CombinedDomains.json").to_s.shellescape
		
		exec("#{cmd} > #{cmd_out}")

		puts "done"
	end

	def generate_inspector_bindings
		puts "generate_inspector_bindings"

		scripts_dir = jsc_dir + "inspector/scripts"
		output_dir = jsc_gen_dir + "inspector"

		output_dir.mkpath

		cmd = [
			"python",
			(scripts_dir + "generate-inspector-protocol-bindings.py").to_s,
			"--outputDir",
			output_dir.to_s,
			"--framework",
			"JavaScriptCore",
			(jsc_gen_dir + "CombinedDomains.json").to_s
		].shelljoin
		exec(cmd)
		puts "done"
	end

	def generate_injected_script_source
		puts "generate_injected_script_source"

		iss_minjs = (jsc_gen_dir + "InjectedScriptSource.min.js").to_s

		cmd = [
			"echo", 
			"//# sourceURL=__InjectedScript_InjectedScriptSource.js"
			].shelljoin
		cmd_out = iss_minjs.shellescape

		exec("#{cmd} > #{cmd_out}")

		cmd = [
			"python",
			(jsc_dir + "Scripts/jsmin.py").to_s			
		].shelljoin
		cmd_in = (jsc_dir + "inspector/InjectedScriptSource.js").to_s.shellescape
		cmd_out = iss_minjs.shellescape

		exec("#{cmd} < #{cmd_in} >> #{cmd_out}")

		cmd = [
			"perl",
			(jsc_dir + "Scripts/xxd.pl").to_s,
			"InjectedScriptSource_js",
			iss_minjs,
			(jsc_gen_dir + "InjectedScriptSource.h").to_s
		].shelljoin

		exec(cmd)

		puts "done"
	end

	def generate_llint_desired_offsets_h
		puts "generate_llint_desired_offsets_h"

		cmd = [
			"ruby",
			(jsc_dir + "offlineasm/generate_offset_extractor.rb").to_s,
			"-I" + jsc_gen_dir.to_s,
			(jsc_dir + "llint/LowLevelInterpreter.asm").to_s,
			(jsc_gen_dir + "LLIntDesiredOffsets.h").to_s
		].shelljoin
		exec(cmd)

		puts "done"
	end

	def generate_keyword_lookup_h
		puts "generate_keyword_lookup_h"

		cmd = [
			"python",
			(jsc_dir + "KeywordLookupGenerator.py").to_s,
			(jsc_dir + "parser/Keywords.table").to_s,
		].shelljoin

		cmd_out = (jsc_gen_dir + "KeywordLookup.h").to_s.shellescape

		exec("#{cmd} > #{cmd_out}")

		puts "done"
	end

	def generate_lut_headers
		sources = [
			"ArrayConstructor.cpp",
			"ArrayIteratorPrototype.cpp",
			"BooleanPrototype.cpp",
			"DateConstructor.cpp",
			"DatePrototype.cpp",
			"ErrorPrototype.cpp",
			"GeneratorPrototype.cpp",
			"InspectorInstrumentationObject.cpp",
			"IntlCollatorConstructor.cpp",
			"IntlCollatorPrototype.cpp",
			"IntlDateTimeFormatConstructor.cpp",
			"IntlDateTimeFormatPrototype.cpp",
			"IntlNumberFormatConstructor.cpp",
			"IntlNumberFormatPrototype.cpp",
			"JSDataViewPrototype.cpp",
			"JSGlobalObject.cpp",
			"JSInternalPromiseConstructor.cpp",
			"JSONObject.cpp",
			"JSPromiseConstructor.cpp",
			"JSPromisePrototype.cpp",
			"MapPrototype.cpp",
			"ModuleLoaderPrototype.cpp",
			"NumberConstructor.cpp",
			"NumberPrototype.cpp",
			"ObjectConstructor.cpp",
			"ReflectObject.cpp",
			"RegExpConstructor.cpp",
			"RegExpPrototype.cpp",
			"SetPrototype.cpp",
			"StringConstructor.cpp",
			"StringIteratorPrototype.cpp",
			"StringPrototype.cpp",
			"SymbolConstructor.cpp",
			"SymbolPrototype.cpp"
		]

		for source in sources
			lut_name = File.basename(source, ".*") + ".lut.h"

			generate_lut_header(
				jsc_dir + "runtime" + source,
				jsc_gen_dir + lut_name)
		end

		generate_lut_header(
			jsc_dir + "parser/Keywords.table",
			jsc_gen_dir + "Lexer.lut.h")
	end

	def generate_lut_header(src, out)
		puts "generate_lut_header(#{out.basename.to_s})"

		cmd = [
			"perl",
			(jsc_dir + "create_hash_table").to_s,
			src.to_s,
			"-i"
		].shelljoin

		cmd_out = out.to_s.shellescape

		exec("#{cmd} > #{cmd_out}")

		puts "done"
	end

	def generate_regexp_jit_tables_h
		puts "generate_regexp_jit_tables_h"

		cmd = [
			"python",
			(jsc_dir + "create_regex_tables").to_s
		].shelljoin
		cmd_out = (jsc_gen_dir + "RegExpJitTables.h").to_s.shellescape

		exec("#{cmd} > #{cmd_out}")

		puts "done"
	end

	def generate_yarr_canonicalize_unicode
		puts "generate_yarr_canonicalize_unicode"

		cmd = [
			"python",
			(jsc_dir + "generateYarrCanonicalizeUnicode").to_s,
			(jsc_dir + "ucd/CaseFolding.txt").to_s,
			(jsc_gen_dir + "YarrCanonicalizeUnicode.cpp").to_s
		].shelljoin

		exec(cmd)

		puts "done"
	end

	def generate_llint_assembly
		archs = Pathname.glob(repo_dir.to_s + "/obj/local/*/libjsc_offsets.so").map {|x|
			x.parent.basename.to_s
		}
		for arch in archs 
			generate_llint_assembly_arch(arch)
		end
	end

	def generate_llint_assembly_arch(arch)
		puts "generate_llint_assembly(arch=#{arch})"

		out_dir = jsc_gen_dir + arch
		out_dir.mkpath

		cmd = [
			"ruby",
			(jsc_dir + "offlineasm/asm.rb").to_s,
			"-I" + jsc_gen_dir.to_s,
			(jsc_dir + "llint/LowLevelInterpreter.asm").to_s,
			(repo_dir + "obj/local" + arch + "libjsc_offsets.so").to_s,
			(out_dir + "LLIntAssembly.h").to_s
		].shelljoin
		exec(cmd)

		puts "done"
	end

end

PrepareJscScript.new.main
