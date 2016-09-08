require "pathname"

$common_rb = {}

$common_rb.tap {|c|
	c[:script_lib_dir] = Pathname(__FILE__).parent.expand_path
	c[:script_dir] = c[:script_lib_dir].parent
	c[:repo_dir] = c[:script_dir].parent
	c[:patch_dir] = c[:repo_dir] + "patch"
	c[:dep_dir] = c[:repo_dir] + "dep"
	c[:gen_dir] = c[:repo_dir] + "gen"
	c[:icu_gen_dir] = c[:gen_dir] + "icu"
	c[:jsc_gen_dir] = c[:gen_dir] + "jsc"
	c[:icu_dir] = c[:dep_dir] + "icu"
	c[:webkit_dir] = c[:dep_dir] + "WebKit"
	c[:wtf_dir] = c[:webkit_dir] + "Source/WTF"
	c[:jsc_dir] = c[:webkit_dir] + "Source/JavaScriptCore"
}

def repo_dir
	$common_rb[:repo_dir]
end

def script_dir
	$common_rb[:script_dir]
	$script_dir
end

def patch_dir
	$common_rb[:patch_dir]
end

def icu_gen_dir
	$common_rb[:icu_gen_dir]
end

def icu_dir
	$common_rb[:icu_dir]
end

def jsc_gen_dir
	$common_rb[:jsc_gen_dir]
end

def jsc_dir
	$common_rb[:jsc_dir]
end

def exec(command)
    system(command)
    st = $?
    if ! st.success?
        raise "exec failed: status=#{st}, command=#{command}"
    end
end

def exec_capture(command)
    capture = `#{command}`
    st = $?
    if ! st.success?
        raise "exec failed: status=#{st}, command=#{command}"
    end
    return capture
end
