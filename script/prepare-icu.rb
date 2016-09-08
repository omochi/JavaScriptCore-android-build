#!/usr/bin/env ruby

require "pathname"
require "fileutils"
require "shellwords"
require_relative "lib/common"

class PrepareIcuScript
	def main
		make_include_dir
	end

	def make_include_dir
		puts "make_include_dir"

		Dir.chdir(icu_dir.to_s)

		include_dir = icu_gen_dir + "include"

		if include_dir.exist?
			include_dir.rmtree
		end

		uc_dir = include_dir + "icuuc"
		uc_dir.mkpath
		FileUtils.cp_r((icu_dir + "common/unicode").to_s, uc_dir.to_s)

		i18n_dir = include_dir + "icui18n"
		i18n_dir.mkpath
		FileUtils.cp_r((icu_dir + "i18n/unicode").to_s, i18n_dir.to_s)

		puts "done"
	end
end

PrepareIcuScript.new.main
