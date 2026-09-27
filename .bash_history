

                                            git push --set-upstream main main     
                        encoding="utf-8", errors="ignore"
                        f"Missing local CSS: {local_css_path} in {file_path}"
                        f"Missing local script: {local_script} in {file_path}"
                    )
                    b64 = base64.b64encode(content).decode("ascii")
                    base_url = href
                    css_base_path = local_css_path
                    css_text = local_css_path.read_text(
                    css_text = raw.decode("utf-8", errors="ignore")
                    css_text, css_base_path, base_url
                    f"({s['time']:.2f}s) - Embedded: "
                    f"\033[92m[SUCCESS]\033[0m "
                    f"\033[93m{s['local']} local\033[0m, "
                    f"\033[93m{s['remote']} remote\033[0m"
                    f"\033[96m{display_path}\033[0m "
                    img["src"] = f"data:{mime};base64,{b64}"
                    logger.warning(
                    mime = get_mime_type(str(local_img_path))
                    script_text = local_script.read_text(
                    script_text = raw.decode("utf-8", errors="ignore")
                    stats["local"] += 1
                    stats["remote"] += 1
                )
                b64 = base64.b64encode(content).decode("ascii")
                clean_href = href.split("?")[0].split("#")[0]
                clean_src = src.split("?")[0].split("#")[0]
                continue
                display_path = raw_path
                display_path = raw_path.relative_to(Path.cwd())
                else:
                if content := read_local(local_img_path):
                if local_css_path.exists():
                if local_script.exists():
                if raw := fetch_remote(href):
                if raw := fetch_remote(src):
                link.replace_with(style_tag)
                loc += 1
                local_css_path = (file_path.parent / clean_href).resolve()
                local_script = (file_path.parent / clean_src).resolve()
                logger.warning(f"Missing local CSS asset referenced: {local_file}")
                logger.warning(f"Missing local image: {local_img_path} in {file_path}")
                new_script.string = script_text
                pass
                print(f"\033[91m[ERROR]\033[0m {display_path} - {status}")
                rem += 1
                return f"url({quote}data:{mime};base64,{b64}{quote})"
                return match.group(0)
                script.replace_with(new_script)
                stats["local"] += c_loc
                stats["local"] += l
                stats["remote"] += c_rem
                stats["remote"] += r
                style.string = processed
                style_tag = soup.new_tag("style")
                style_tag.string = processed_css
            clean_src = src.split("?")[0].split("#")[0]
            clean_url = url.split("?")[0].split("#")[0]
            content = fetch_remote(target_url)
            content = read_local(local_file)
            elif status == "skipped":
            else:
            except ValueError:
            href = link.get("href")
            if content:;                 mime = get_mime_type(str(local_file))
            if content:;                 mime = get_mime_type(urlparse(target_url).path)
            if css_text:;                 processed_css, c_loc, c_rem = process_css_content(
            if is_image(url):
            if is_remote(src):
            if local_img_path.exists():
            if not href:;                 continue;             css_text, base_url, css_base_path = "", None, file_path;             if is_remote(href):
            if not local_file.exists():
            if not src or src.startswith("data:"):
            if not src:;                 continue;             script_text = "";             if is_remote(src):
            if script_text:;                 new_script = soup.new_tag("script")
            if status == "success":;                 print(
            if style.string:;                 processed, l, r = process_css_content(style.string, file_path)
            local_file = (base_path.parent / clean_url).resolve()
            local_img_path = (file_path.parent / clean_src).resolve()
            processed, l, r = process_css_content(tag["style"], file_path)
            raw_path = Path(s["path"])
            response.raise_for_status()             return response.content
            return match.group(0)
            s = future.result()
            src = img.get("src")
            src = script.get("src")
            stats["local"] += l
            stats["remote"] += r
            status = s["status"]
            t_loc += s["local"]
            t_rem += s["remote"]
            tag["style"] = processed
            target_url = urljoin(base_url, url) if base_url else url
            targets.append(p)
            targets.extend(p.rglob("*.css"))
            targets.extend(p.rglob("*.html"))
            try:
        "local": 0,
        "path": str(file_path),
        "path": str(path),
        "paths",
        "remote": 0,
        "status": "skipped",
        "status": "success",
        "time": 0.0,
        content = file_path.read_text(encoding="utf-8")
        default=["."],
        elif p.is_dir():
        else:
        f"Total globally embedded resources: \033[93m{t_loc}\033[0m local, \033[93m{t_rem}\033[0m remote."
        f"\033[96mProcessing {len(targets)} files across multiple CPU cores...\033[0m\n"
        file_path.write_text(processed_css, encoding="utf-8")
        file_path.write_text(str(soup), encoding="utf-8")
        for future in as_completed(futures):
        for img in soup.find_all("img"):
        for link in soup.find_all("link", rel="stylesheet"):
        for script in soup.find_all("script"):
        for style in soup.find_all("style"):
        for tag in soup.find_all(style=True):
        futures = {executor.submit(process_file, p): p for p in targets}
        help="Files or directories to process (default: current directory)",
        html_text = file_path.read_text(encoding="utf-8")
        if ext == ".woff2":;             return "font/woff2";         if ext == ".woff":;             return "font/woff";         if ext == ".ttf":;             return "font/ttf";         if ext == ".eot":;             return "application/vnd.ms-fontobject";         return "application/octet-stream";     return mime; def fetch_remote(url: str) -> bytes | None:
        if is_remote(url):
        if p.is_file() and p.suffix.lower() in (".html", ".css"):
        if url.startswith("data:"):
        logger.error(f"Failed to fetch {url}: {e}")
        logger.error(f"Failed to process CSS file {file_path}: {e}")
        logger.error(f"Failed to process HTML file {file_path}: {e}")
        logger.error(f"Failed to read {path}: {e}")
        nargs="*",
        nonlocal loc, rem
        processed_css, l, r = process_css_content(content, file_path)
        quote = match.group(1)
        return
        return None
        return path.read_bytes()
        return process_css_file(path)
        return process_html_file(path)
        soup = BeautifulSoup(html_text, "html.parser")
        stats["local"] += l
        stats["remote"] += r
        stats["status"] = f"error: {e}"
        url = "https:" + url
        url = match.group(2)
        with requests.get(url, timeout=TIMEOUT) as response:
    ".avif",
    ".bmp",
    ".gif",
    ".ico",
    ".jpeg",
    ".jpg",
    ".png",
    ".svg",
    ".tiff",
    ".webp",
    )
    args = parser.parse_args()
    css_content: str, base_path: Path, base_url: str | None = None
    def replacer(match: re.Match) -> str:
    elif path.suffix.lower() == ".css":
    except Exception as e:
    ext = Path(urlparse(url).path).suffix.lower()
    for p_str in args.paths:;         p = Path(p_str)
    if not mime:;         ext = Path(file_path).suffix.lower()
    if not targets:;         print("\033[93mNo HTML or CSS files found to process.\033[0m")
    if path.suffix.lower() == ".html":
    if url.startswith("//"):
    loc, rem = 0, 0
    mime, _ = mimetypes.guess_type(file_path)
    new_css = CSS_URL_PATTERN.sub(replacer, css_content)
    parser = argparse.ArgumentParser(description="Standalone HTML/CSS Bundler Tool")
    parser.add_argument(
    print(
    return ext in IMAGE_EXTENSIONS
    return new_css, loc, rem
    return stats
    return urlparse(url).scheme in ("http", "https") or url.startswith("//")
    return {
    start = time.perf_counter()
    start_time = time.perf_counter()
    stats = {
    stats["time"] = time.perf_counter() - start
    sys.stderr, level="WARNING", format="<red>{level}</red> | <cyan>{message}</cyan>"
    t_loc, t_rem = 0, 0
    targets = list({p.resolve(): p for p in targets}.values())
    targets: list[Path] = []
    total_time = time.perf_counter() - start_time
    try:
    with ProcessPoolExecutor() as executor:
    }
   · Add missing docstrings to all functions and classes.
   · If missing, add a module docstring as the first lines after the shebang. This docstring must be written as a concise prompt that could regenerate the entire script.
 /data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-0CTWV3/mcusrUESSV3
 /data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-92AWU3/mcusrQTL5U3
 /data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-BIUJV3/mcusrMV2XV3
 /data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-OA0UV3/mcusrI9AQV3
 bind -x '"\e+":"echo $BASH_VERSINFO:$READLINE_POINT >&10"'
 bind -x '"\e_":"mc_print_command_buffer"'
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057cache'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057cache\0057apt'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057cache\0057apt\0057archives'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057cache\0057apt\0057archives\0057partial'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057bin'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057pip'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cargo'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cargo\0057bin'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057cmake'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057numpy\00552\00565\00562\0056dist\0055info'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057Comment\0056nvim'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057alpha\0055nvim'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056termux\0055build'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057bashbin'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057bin'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057bin\0057py'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057bin\0137sep'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057downloads'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057git\0137analizer'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057git\0137analizer\0057shfmt'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057env'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057md'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057me1'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057no\0137extension'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057no\0137extension\0057py'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057py'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057py\0057py'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057sh'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057toml'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057arena\0057output\0057txt'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057q1'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057shfmt'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cramjam\0057benchmarks'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cramjam\0057benchmarks\0057data'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cramjam\0057benchmarks\0057data\0057pdf'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cramjam\0057benchmarks\0057data\0057protodata'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cramjam\0057benchmarks\0057data\0057tar\0057mozilla\0057components'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cramjam\0057benchmarks\0057data\0057txt'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057buid\0137cross'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057grpc'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057lingua\00554\005616\00562'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057lingua\00554\005616\00562\0057lingua'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057lingua\00554\005616\00562\0057lingua\0057src'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057lingua\00554\005616\00562\0057lingua\0057src\0057lingua'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057armv7\0055linux\0055androideabi'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057armv7\0055linux\0055androideabi\0057release'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057release'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057release\0057\0056fingerprint'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057release\0057build'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057release\0057build\0057crossbeam\0055deque\00550256c1f8a7e52d1d'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057release\0057build\0057zmij\00552b01804e1823bf5c'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057release\0057deps'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057release\0057examples'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pipdeptree\0057target\0057release\0057incremental'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target\0057armv7\0055linux\0055androideabi'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target\0057armv7\0055linux\0055androideabi\0057release'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target\0057armv7\0055linux\0055androideabi\0057release\0057build'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target\0057armv7\0055linux\0055androideabi\0057release\0057deps'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target\0057release'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target\0057wheels'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target\0057wheels\0057pylyzer\00550\00561\00560b0\0056data'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target\0057wheels\0057pylyzer\00550\00561\00560b0\0056data\0057scripts'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057pylyzer\00550\00561\00560b0\0057target\0057wheels\0057pylyzer\00550\00561\00560b0\0056dist\0055info'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057gemini'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057gemini\0057aiohttp\00553\00569\00565'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057gemini\0057aiohttp\00553\00569\00565\0057aiohttp\0137docs'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057gemini\0057aiohttp\00553\00569\00565\0057aiohttp\0137docs\0057\0137static'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057gemini\0057aiohttp\00553\00569\00565\0057aiohttp\0137docs\0057\0137static\0057css'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057gemini\0057aiohttp\00553\00569\00565\0057examples'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057gemini\0057aiohttp\00553\00569\00565\0057requirements'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057gemini\0057aiohttp\00553\00569\00565\0057tests'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057gemini\0057aiohttp\00553\00569\00565\0057vendor'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pwords'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pwords\0057words'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057\0137static'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057\0137static\0057fontello'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057\0137static\0057fonts'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057\0137static\0057html'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057\0137static\0057html\0057airank'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057\0137static\0057html\0057airank\0057mhr'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057\0137static\0057html\0057assets'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057\0137static\0057html\0057assets\0057data'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057\0137static\0057html\0057assets\0057fonts'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057backups'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057backups\0057apps'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057backups\0057css'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057backups\0057html'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057book'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057book\0057hack'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00570'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00570\00570'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00570\0057a'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00570\0057py'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057apps'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057bin\0137sep'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057css'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057css\0057css'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057css\0057js'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057astc'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057dic'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057html'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057html\0057css'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057html\0057js'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057info'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057input\0137mean\0137std\0137dev'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057jar'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057jpg'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057js'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057json'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057pdf'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057ttf'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057zip'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057zip\0057bin'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057zip\0057dic'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057zip\0057dict'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057zip\0057fst'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057font\0057zip\0057txt'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057html'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057out'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057out\0057py'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pkgs'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057whl'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057www\0056subtitlecat\0056com'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057typings'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057bin'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057etc'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057etc\0057apt'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib\0057python3\005614\0057site\0055packages'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib\0057python3\005614\0057site\0055packages\0057msgpack'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057doc'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057doc\0057ty'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057man'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055ibhmims\0137\0057dutree\01370dcd5dee6d794299a49bad3876f4c6b8\0057dist'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055ibhmims\0137\0057dutree\01370dcd5dee6d794299a49bad3876f4c6b8\0057dist\0057dutree'`"
 cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055ibhmims\0137\0057dutree\01370dcd5dee6d794299a49bad3876f4c6b8\0057dist\0057dutree\00551\00568\0056dist\0055info'`"
 cd "`printf '%b' '\0057sdcard'`"
 cd "`printf '%b' '\0057sdcard\0057Download'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057battle\0137mod'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057css'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057css\0057font'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057css\0057html'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057css\0057pfonts'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057css\0057rs'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057dic'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057dict'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057extracted\0137base64'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057extracted\0137base64\0057html'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057extracted\0137base64\0057md'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057extracted\0137base64\0057woff2'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057fontello'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057fonts'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057fonts\005760k\00552M'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057html'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057html\0057css'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057html\0057css\0057assets'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057html\0057mht'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057mht'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057pypi\0056org'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057pypi\0056org\0057css'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057pypi\0056org\0057html'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057pypi\0056org\0057json'`"
 cd "`printf '%b' '\0057sdcard\0057\0137static\0057stylesheets'`"
 cd "`printf '%b' '\0057sdcard\0057docs'`"
 cd "`printf '%b' '\0057sdcard\0057docs\0057aiohttp\0137docs'`"
 cd "`printf '%b' '\0057sdcard\0057docs\0057man'`"
 cd "`printf '%b' '\0057sdcard\0057jaraco'`"
 cd "`printf '%b' '\0057sdcard\0057misc'`"
 cd "`printf '%b' '\0057sdcard\0057misc\0057css'`"
 cd "`printf '%b' '\0057sdcard\0057misc\0057js'`"
 cd "`printf '%b' '\0057sdcard\0057series'`"
 cd "`printf '%b' '\0057sdcard\0057summa'`"
 cd "`printf '%b' '\0057sdcard\0057whl'`"
 cf2mp4 --help
 cf2mp4 --write .
 check4update
 find_elf
 find_missing_imports.py 
 fix_bash_shebang
 fix_bash_shebang.py 
 if test ${BASH_VERSION%%.*} -ge 5 && [[ ${PROMPT_COMMAND@a} == *a* ]] 2> /dev/null; then    eval "PROMPT_COMMAND+=( 'pwd>&8;kill -STOP $$' )";  else    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND }'pwd>&8;kill -STOP $$';  fi
 mc_print_command_buffer () { printf "%s\\n" "$READLINE_LINE" >&10; }
 migrate_cf2mp.py
 n url
"blue",
"i
#1787842225
#1787842228
#1787842231
#1787842235
#1787842236
#1787842250
#1787842256
#1787842262
#1787842278
#1787842288
#1787842308
#1787842321
#1787842372
#1787842413
#1787842414
#1787842423
#1787842468
#1787842474
#1787842490
#1787842496
#1787842516
#1787842523
#1787842576
#1787842579
#1787842616
#1787842625
#1787842635
#1787842642
#1787842677
#1787842733
#1787842778
#1787842914
#1787842934
#1787842947
#1787842985
#1787843025
#1787843134
#1787843139
#1787843143
#1787843154
#1787843700
#1787843741
#1787843745
#1787843771
#1787843796
#1787843803
#1787843849
#1787843860
#1787843864
#1787843996
#1787844001
#1787844152
#1787844174
#1787844199
#1787844212
#1787844222
#1787844226
#1787844237
#1787844240
#1787844309
#1787844349
#1787844394
#1787844421
#1787844487
#1787844497
#1787844542
#1787844553
#1787844574
#1787844590
#1787844602
#1787844608
#1787844613
#1787844623
#1787844834
#1787844849
#1787844951
#1787844954
#1787844958
#1787844975
#1787845017
#1787845021
#1787845025
#1787845107
#remove indentation before processing(Remove spaces & tabs from both side)
&trr
'
''
'''
''''
'1
'l
's2
)
) -> list[str]:
) -> tuple[str, int, int]:
,,
,,,
--[Ciyt
.
. ../../init.lua
. .gitignore
. create_symlink
. refactai.lua
. tokyo.lua
..
..'
...
....
.....
./Jamfile
./buildconf
./cleam_text
./clean_text
./configure
./configure --prefix=$HOME/.local
./configure.py
./demo.sh
./findsn.sh
./findsn.sh .
./get_title
./githelper.py
./lxc-exec
./mdef
./mine
./mozilla
./protoc
./pyenv
./pyenv init bash
./pylyzer
./rmc
./rust-analyzer-proc-macro-srv 
./s
./truecolor
.github_token
/
//1
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-2XRIU3/mcusrSML3T3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-47V2U3/mcusr4EJTU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-47V2U3/mcusrCJF5U3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-47V2U3/mcusrOXWTU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-57O4U3/mcusr0XO8U3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-57O4U3/mcusr4KVUU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-57O4U3/mcusrLC7XU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-D6A6U3/mcusrR1IAV3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-FKXTU3/mcusrB9FQU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-TLXFU3/mcusr0WYDU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-TLXFU3/mcusr12X7T3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-TLXFU3/mcusr72FFU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-TLXFU3/mcusrQ7UNU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-TY80U3/mcusr159QU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-TY80U3/mcusrHSDAV3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-TY80U3/mcusrKLDBV3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-UHFJU3/mcusrM6VFU3
/data/data/com.termux/files/usr/bin/sh /data/data/com.termux/files/usr/tmp/mc-VHYUU3/mcusrATABV3
0
00
0;10;1M**
0;12;1M
0;13;1M
0;14;2M
0;15;4M
0;19;15M0;7;s2
0;36;7M
0;37;8M
0;39;7M0;10;1M0;12;1M
0;40;16Mtmp
0;40;8M
0;41;16M
0;41;17Mlob
0;41;18M
0;42;16M0;40;16M
0;42;17M0;39;9M0;11;1M0;11;1M
1. Concurrency migration: Replace all concurrent.futures usage with multiprocessing.Pool.apply_async, using a fixed pool of 8 workers. Remove any --worker, --job, or similar CLI arguments controlling parallelism.
2. Type annotations: Add complete type hints to all functions, methods, class attributes, arguments, return types, module-level constants, and variables where missing. Ensure the code passes a strict type checker (e.g., mypy/pyright).
22
223
2to3 -w --diff .
2to3 -w .
2to3 -w doc-debtags
2to3 -w setup.py 
3. Docstrings:
33
4. Logging: Replace print statements and the standard logging module with loguru.
5. Path handling: Replace all os.path usage with pathlib.
6
6. Bug fixes: Fix any issues that would cause type checkers to complain (missing imports, wrong signatures, Optional handling, etc.).
64;33;9M
64;37;11M
64;37;8M
64;38;9M
64;39;7M
64;40;12M
64;40;8M
64;42;10M
65;40;9M64;39;7M
65;44;8M64;38;8M
7z t grpcio-1.83.1-cp312-cp312-linux_armv7l.whl
7z t pandas-2.3.3-cp312-cp312-linux_armv8l.whl
7z t pylyzer-0.1.0b0-py3-none-manylinux_2_17_armv8l.manylinux2014_armv8l.whl 
7z t scipy-1.16.3-cp312-cp312-linux_arm.whl
7z t ux.stackexchange.com.7z
7z x  monolith-94qhpl
7z x *.arsc
7z x *.pyz
7z x FiraMono.zip
7z x PYZ-00.pyz
7z x b1.arsc
7z x bin.7z
7z x d.7z
7z x d.html.7z
7z x data.7z
7z x dotfiles.7z
7z x etc.7z
7z x f.zip
7z x include.7z
7z x isaac.7z
7z x lazy.7z
7z x lua.7z
7z x lxml-6.1.1-cp312-cp312-linux_armv8l.whl
7z x man.7z
7z x pandas-2.3.3-cp312-cp312-linux_armv8l.whl
7z x pylyzer-0.1.0b0-py3-none-manylinux_2_17_armv8l.manylinux2014_armv8l.whl 
7z x related.xpt 
7z x rmc.pkg
7z x scipy-1.16.3-cp312-cp312-linux_arm.whl
7z x share.7z
7z x state.7z
7z x trend.7z
7z x tsp.7z
7z x useful_tools.7z
7z x ux.stackexchange.com.7z
7z x چارگون\ -\ مدیریت\ یکپارچه\ فرآیندهای\ سازمانی.7z
9
96
:
:q
BRKBRKBRK
C
CSS_URL_PATTERN = re.compile(r'url\((["\']?)([^)"\']+)\1\)')
IMAGE_EXTENSIONS = {
Jamfile-engine
MATHLIB=m LDFLAGS="-l python3.12" pip install --verbose numpy
MATHLIB=m LDFLAGS="-lpython3.12" pip install --no-build-isolation  --force-reinstall numpy
MATHLIB=m LDFLAGS="-lpython3.12" pip install --no-build-isolation  numpy
MATHLIB=m LDFLAGS="-lpython3.12" pip install --verbose numpy
MATHLIB=m LDFLAGS="-lpython3.12" pip install numpy
MATHLIB=m LDFLAGS="-lpython3.12" python -m pip install --verbose numpy
MATHLIB=m LDFLAGS=-lpython3.12 python -m pip install numpy --no-build-isolation
MATHLIB=m LDFLAGS=-lpython3.12 python -m pip install numpy --verbose
MATHLIB=m LDFLAGSZ="-l python3.12" pip install --verbose numpy
PYMUPDF_USE_SYSTEM_MUPDF=1 python -m build -w
PYTHONPYCACHEPREFIX="__pycache__" mkpic -o 2 -l
PYTHONPYCACHEPREFIX="__pycache__" mkppic -o 2 -l
Return the fully refactored script.'
TIMEOUT = 10
X
]
_, lines1 = future1.result()
_, lines2 = future2.result()
_temp
a
aa3zw[H-//_p;;p//1;1t
aar
aaá
adapter
add2gitignore
add_typing
add_typing x5.py
add_typing yap.py
addmain
aer "https://files.pythonhosted.org/packages/1b/63/b9e1c2170463cff254a0b9927386bd92006cc3d506ef5d29074b1a4c0db2/pypdfium2-4.18.0.tar.gz"
aer "https://files.pythonhosted.org/packages/43/27/72ae94ea5c8f7349ec1c229d4cd058feb799cbd0833ad6d1b47c919b37b7/llvmlite-0.49.0.tar.gz"
aer "https://raw.githubusercontent.com/flakeheaven/flakeheaven/main/pyproject.toml"
aer bhttps://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E12.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S01/480p.BluRay/Black.Sails.S01E01.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S01/480p.BluRay/Black.Sails.S01E04.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S01/480p.BluRay/Black.Sails.S01E05.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S01/480p.BluRay/Black.Sails.S01E06.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S01/480p.BluRay/Black.Sails.S01E07.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S01/480p.BluRay/Black.Sails.S01E08.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E01.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E02.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E03.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E04.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E05.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E06.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E07.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E08.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E09.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S02/480p.BluRay/Black.Sails.S02E10.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E01.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E02.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E03.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E04.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E05.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E06.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E07.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E08.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E09.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S03/480p.BluRay/Black.Sails.S03E10.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S04/480p.BluRay/Black.Sails.S04E01.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S04/480p.BluRay/Black.Sails.S04E02.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S04/480p.BluRay/Black.Sails.S04E03.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S04/480p.BluRay/Black.Sails.S04E04.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S04/480p.BluRay/Black.Sails.S04E05.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S04/480p.BluRay/Black.Sails.S04E06.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S04/480p.BluRay/Black.Sails.S04E07.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Black.Sails/Soft.Sub/S04/480p.BluRay/Black.Sails.S04E09.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S07/480p.BluRay/House.M.D.S07E02.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E06.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E07.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E08.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E11.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E12.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E13.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E14.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E15.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E16.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E17.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E18.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E19.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E20.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E21.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/House.M.D/Soft.Sub/S08/480p.BluRay/House.M.D.S08E22.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S01/480p.Web-DL/Outer.Banks.S01E02.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S01/480p.Web-DL/Outer.Banks.S01E03.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S01/480p.Web-DL/Outer.Banks.S01E04.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S01/480p.Web-DL/Outer.Banks.S01E05.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S01/480p.Web-DL/Outer.Banks.S01E06.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S01/480p.Web-DL/Outer.Banks.S01E07.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S01/480p.Web-DL/Outer.Banks.S01E08.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S01/480p.Web-DL/Outer.Banks.S01E09.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S01/480p.Web-DL/Outer.Banks.S01E10.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Outer.Banks/Soft.Sub/S02/480p.Web-DL/Outer.Banks.S02E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E02.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E03.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E04.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E05.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E06.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E07.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E08.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E09.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Power.Book.IV.Force/Soft.Sub/S01/480p.Web-DL/Power.Book.IV.Force.S01E10.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Roar/Soft.Sub/S01/720p.x265.Web-DL/Roar.S01E01.720p.WEB-DL.x265.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E01.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E02.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E05.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E06.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E07.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E08.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E09.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E10.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E11.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S01/480p.BluRay/Shameless.S01E12.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E01.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E02.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E03.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E04.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E05.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E06.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E07.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E08.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E09.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E10.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S02/480p.BluRay/Shameless.S02E11.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E03.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E04.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E05.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E06.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E07.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E08.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E09.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E10.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E11.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E12.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S04/480p.BluRay/Shameless.S04E01.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S04/480p.BluRay/Shameless.S04E02.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S04/480p.BluRay/Shameless.S04E03.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S04/480p.BluRay/Shameless.S04E04.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S04/480p.BluRay/Shameless.S04E05.480p.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Taboo/Dubbed/S01/480p.BluRay/Taboo.S01E01.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Taboo/Dubbed/S01/480p.BluRay/Taboo.S01E02.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Taboo/Dubbed/S01/480p.BluRay/Taboo.S01E03.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Taboo/Dubbed/S01/480p.BluRay/Taboo.S01E04.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Taboo/Dubbed/S01/480p.BluRay/Taboo.S01E05.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Taboo/Dubbed/S01/480p.BluRay/Taboo.S01E06.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/The.Girl.from.Plainville/Soft.Sub/S01/480p.Web-DL/The.Girl.from.Plainville.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/The.Girl.from.Plainville/Soft.Sub/S01/480p.Web-DL/The.Girl.from.Plainville.S01E08.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/The.Old.Man/Soft.Sub/S01/480p.Web-DL/The.Old.Man.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/The.Staircase/Soft.Sub/S01/480p.Web-DL/The.Staircase.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/The.Staircase/Soft.Sub/S01/720p.x265.10bit.Web-DL/The.Staircase.S01E07.720p.10bit.WEB-DL.x265.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Home.Before.Dark/Soft.Sub/S01/480p.Web-DL/Home.Before.Dark.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Invisible.City/Soft.Sub/S01/480p.Web-DL/Invisible.City.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Invisible.City/Soft.Sub/S01/480p.Web-DL/Invisible.City.S01E02.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Invisible.City/Soft.Sub/S01/480p.Web-DL/Invisible.City.S01E03.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Invisible.City/Soft.Sub/S01/480p.Web-DL/Invisible.City.S01E04.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Invisible.City/Soft.Sub/S01/480p.Web-DL/Invisible.City.S01E05.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Invisible.City/Soft.Sub/S01/480p.Web-DL/Invisible.City.S01E06.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Invisible.City/Soft.Sub/S01/480p.Web-DL/Invisible.City.S01E07.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Landscapers/Soft.Sub/S01/480p.Web-DL/Landscapers.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Landscapers/Soft.Sub/S01/480p.Web-DL/Landscapers.S01E02.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Landscapers/Soft.Sub/S01/480p.Web-DL/Landscapers.S01E03.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/Landscapers/Soft.Sub/S01/480p.Web-DL/Landscapers.S01E04.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/The.Irregulars/Soft.Sub/S01/480p.Web-DL/The.Irregulars.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/The.Irregulars/Soft.Sub/S01/480p.Web-DL/The.Irregulars.S01E02.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/The.Irregulars/Soft.Sub/S01/480p.Web-DL/The.Irregulars.S01E03.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/The.Irregulars/Soft.Sub/S01/480p.Web-DL/The.Irregulars.S01E04.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/The.Irregulars/Soft.Sub/S01/480p.Web-DL/The.Irregulars.S01E05.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/The.Irregulars/Soft.Sub/S01/480p.Web-DL/The.Irregulars.S01E06.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/The.Irregulars/Soft.Sub/S01/480p.Web-DL/The.Irregulars.S01E07.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls5.aparatchi-dlcenter.top/DonyayeSerial/series/The.Irregulars/Soft.Sub/S01/480p.Web-DL/The.Irregulars.S01E08.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls6.aparatchi-dlcenter.top/DonyayeSerial/series/I.Am.the.Night/Soft.Sub/S01/480p.Web-DL/I.Am.the.Night.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls6.aparatchi-dlcenter.top/DonyayeSerial/series/I.Am.the.Night/Soft.Sub/S01/480p.Web-DL/I.Am.the.Night.S01E02.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls6.aparatchi-dlcenter.top/DonyayeSerial/series/I.Am.the.Night/Soft.Sub/S01/480p.Web-DL/I.Am.the.Night.S01E03.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls6.aparatchi-dlcenter.top/DonyayeSerial/series/I.Am.the.Night/Soft.Sub/S01/480p.Web-DL/I.Am.the.Night.S01E04.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls6.aparatchi-dlcenter.top/DonyayeSerial/series/I.Am.the.Night/Soft.Sub/S01/480p.Web-DL/I.Am.the.Night.S01E05.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://dls6.aparatchi-dlcenter.top/DonyayeSerial/series/I.Am.the.Night/Soft.Sub/S01/480p.Web-DL/I.Am.the.Night.S01E06.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aer https://files.pythonhosted.org/packages/27/79/8a850fe3496446ff0d584327ae44e7500daf6764ca1a382d2d02789accf7/pip-20.3.4-py2.py3-none-any.whl
aer https://files.pythonhosted.org/packages/8d/9a/e0a4e92a85fc17be7c54afdbb113f0ade2a8bca49856d510e28bd249e462/pymupdf-1.26.5.tar.gz
aer https://files.pythonhosted.org/packages/d2/2d/d4217feecdf93101773630a9be5b2f5e1be1fc6070521094b876cc4a2be4/pylzma-0.6.1.tar.gz
aer https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.0/FiraMono.zip
aer https://sourceforge.net/projects/hunspell/files/Hunspell/1.2.15/hunspell-1.2.15.tar.gz/download
aerbhttps://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/Shameless/Soft.Sub/S03/480p.BluRay/Shameless.S03E12.480p.SoftSub.DonyayeSerial.mkv
afk -a
afk -a .
afk -a __init__.py
afk -a clean_record.py
afk checkspell -a
afk perpage2.py
afkco
afkco -a
afkco -a fileutils.py
agagc
aichat
aichat 'implenent dos2unix in python'
ali
alias
alias rg='rg 2>/dev/null'
alu
ap8
apk_font_extractor
apk_font_extractor -w 8 -o ~/tmp/font
appender
appendr -a a*.py
appendr -a add2db.oy
appendr -a add2db.py
appendr -a appendr.py
appendr -t armc
appendr -t armc.py
appendr a*.py
appendr add2db.oy -t
appendr appendr.py
appendr b*.py
appendr.py -t appendr.py
apt --fix-broken install
apt autoremore
apt autoremove
apt update
apt upgrade
apt-mark hold abseil-cpp
apt-mark hold libprotobuf
apt-mark hold protobuf
apt-mark hold rust
apt-mark hold rust-std-armv7-linux-androideabi
apt-mark hold swig
apt-mark hold vulkan-loader-generic
apti abseil-cpp
apti aichat
apti aspell
apti autopoint
apti bash-completion
apti binutils
apti brotli zstd lz4
apti cmake
apti cronie
apti ctags
apti dialog
apti dialog astyle
apti dirb
apti double-conversion
apti double-convertion
apti duc
apti ed gh libcap-ng
apti ffmpeg
apti figlet
apti file
apti freeglut
apti gdu
apti gh
apti googletest google-glog
apti gst-libav
apti harfbuzz
apti hunspell
apti hyperfine
apti iproute2
apti jpegoptim
apti ldd
apti libandroid-complex-math
apti libgit2
apti libglvnd-dev shared-mime-info,c
apti libharfbuz
apti libharfbuzz
apti libimagequant
apti libopenblas
apti libopenmpt
apti libprotobuf
apti libre2
apti libxkbcommon
apti libxml2 libxslt
apti llvm
apti luarock
apti luarocks
apti mandoc
apti ncdu
apti ncdu2
apti neovim-nightly
apti ninja python-cmake
apti opencv
apti openjpeg
apti openjpeg-tools
apti openssh openssh-sftp-server
apti pngquant
apti protobuf
apti pyrefly
apti python-cmake
apti python-cryptography
apti python-mupdf python-pymupdf
apti python-pillow
apti python-pillowáá
apti python-pipcl
apti python-pymupdf
apti python-pynvim
apti ruff ty libgit2 python-ruff
apti rust
apti sqlite
apti tcl liblzma libexpat libcrypt openssl ca-certificates libandroid-posix-semaphore readline gdbm ncurses pcre2 libiconv libffi libandroid-support freetype libpng libwebp zlib libbz2 brotli libc++
apti tesseract
apti texinfo
apti tidy
apti tree
apti trew
apti ty
apti vulkan-loader-generic nodejs neovim-nightly command-not-found
apti w3m
apti x11-repo root-repo tur-repo
apti xclip
apti xxhash ssdeep
apti xz-utils
aptp abseil-cpp
aptp aspell
aptp mupdf
aptp mupdf-tools
aptp openjdk-26
aptp python-mupdf
aptp rust-std-armv7-linux-androideabi
aptr python-cmake
aptr python-pip
apts abs
apts absa
apts absail
apts analyzer
apts blas
apts chat
apts chm
apts cms
apts ctag
apts demangle
apts double-convertion
apts egl
apts figlet
apts gast
apts google
apts grpc
apts harf
apts ip
apts lcm
apts ldms
apts libav
apts libm
apts libmath
apts llvm
apts luarock
apts math
apts mupdf
apts ncdu
apts netsh
apts nvim
apts openjpeg
apts orphan
apts pyproject
apts re2
apts spell
apts sqlite
apts vim
apts xclip
apts xkb
aptu figlet
ar x llvm-tools_21.1.8-3_arm.deb
ar x opencv-python_4.12.0-6_arm.deb
ar x opencv_4.12.0-6_arm.deb
ar x python-pip_25.3_all.deb
ar x python-tiktoken_0.12.0_arm.deb
ar x qt6-qt5compat_6.10.1_arm.deb
ar x qt6-qtbase_6.10.1-3_arm.deb
ar x qt6-qtdeclarative_6.10.1_arm.deb
ar x qt6-qtlanguageserver_6.10.1_arm.deb
ar x qt6-shadertools_6.10.1_arm.deb
ar x rust_1.98.1_arm.deb 
aria2c --continue
aria2c --file-allocation=none -j 8
aria2c --file-allocation=none -j 8 https://dls6.aparatchi-dlcenter.top/DonyayeSerial/series/I.Am.the.Night/Soft.Sub/S01/480p.Web-DL/I.Am.the.Night.S01E02.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
aria2c --hel'
aria2c --help
aria2c --help | grep space
aria2c -i file_urls.txt -d downloads -j 8 -x 8 -s 8
arkc
arm *.xz
armc
armc -c
armc -c .
armc -c armc.py
armc .
armc armc.py
armc gfixre.py
armc pdfdocument.py
armc pkg_resources_reporter_autofixer.py
armc refactor_proj
aspell help
asteval
asteval --help
asteval --parallel thread .
autclone
autobuild
autoclone
autoconf
automake
automake --add-missing
autoreconf
aáá!
b
b642f 1_3.css
bash - cargo_publish.sh  --pip-only
bash 001.sh 
bash 03.sh 
bash 04.sh 
bash 05.sh 
bash 06.sh 
bash 07.sh 
bash 08.sh 
bash 09.sh 
bash 11.sh 
bash 12.sh 
bash 13.py 
bash 13_1.sh 
bash 14_1.sh 
bash 41b9a0c57802f01.js
bash 820319a78e8bf75.js
bash autogen.sh
bash build-package.sh  matplotlib
bash build-package.sh  python
bash build-package.sh  python-pymupdf
bash build.sh
bash build.sh 
bash build_ext.sh
bash c0.sh 
bash ci-install.sh
bash create_monthly_branch.sh
bash curl_req.sh
bash get_the_book.sh
bash install.sh
bash install_libzmq.sh
bash install_nvim.sh
bash install_python_tools.sh
bash jump.sh
bash lazysync
bash luals-check.sh
bash make_zip.sh
bash newtab
bash prereqs.sh
bash report.sh
bash run-mozilla.sh 
bash run-tests.sh
bash scripts/check-queries.lua
bash scripts/mini.sh
bash sed1.sh 
bash setup-hooks.sh
bash url
bash urls.txt
bash yt2txt.sh
bash2py 011.sh 
bash2py 038.sh 
bashbin
bashtopy 011.sh 
bat2bash
bb
bbb
bbc
bbn
bcc
bcss
bcss 30b998696efcb1d.css
bext
bhtml best_ai_tools_in_germany_2025___aiting_ai_1.html
bhtml defaultrulesruff1.html 
bhtml fanar.html
bhtml free.html 
bhtml markdown.css.html
bhtml optipng.html
bhtml pythons_pre-declared_constants_are_kinda_weird.html
bhtml rulesruff1.html 
bhtml source4.html
bhtml source5.html
bhtml source6.html
bhtml stripe_mobile_sdk_ece_bridge_1.html
bind -x '"\e+":"echo $BASH_VERSINFO:$READLINE_POINT >&10"'
bind -x '"\e_":"mc_print_command_buffer"'
bkk
bkl
black --help
black -l 120 -W 8 --python-version py312 b*.py
black -l 120 -W 8 --target-version py312 *.py
black -l 120 -W 8 --target-version py312 --preview --verbose *.py
black -l 120 -W 8 --target-version py312 b*.py
black -l 120 -W 8 a*.py
black -l 120 -j 8 a*.py
black -l 120 -w 8 a*.py
black -l 120 .
black .
blimk
blink
blink '
blink -a
blink -d
blink -r
blj
blk
bn
bnn 1.md 
bnn 4
bnn dirb.py
bnn topics.json
book
br -c
brmc
brmc detect_pkgresources.py
brmc gfixre.py
brmc keywords.py
brmc pdfdocument.py
brmc pkg_resources_reporter_autofixer.py
brmc refactor_proj
brmc reinstaller.py
brmc setup.py
brmc test1.py
brotli --help
brotli -d *.br
brotli -d -j *.br
brotli -d -j br2.py.br
brotli -d br2.br
brotli -d br2.py.br
brotli -d br2.vr
bv
bvc
bzr
bzr -d
c
c4u
ca appendr.py
calc 8192/2
cargo --version
cargo build
cargo build --release --locked
cargo check
cat *.lua >> init
cat *.lua >> init.lua
cat *.txt >> all
cat .bashrc_2 >> .bashrc
cat .git/config
cat .pylintrc
cat 001.json >> 000.json
cat INSTALL
cat README.markdown
cat README.md
cat README.txt
cat RECORD
cat a.json >> abbr.txt
cat abbr.json >> hunspell_dic.json
cat ans.md
cat bb.json >> abbr.json
cat blink.lua >> blink-cmp.lua
cat ci-install.sh >> furls.py
cat config
cat configuration.md
cat dic_fa.json >> final_fa.json
cat entry_points.txt
cat errors.txt
cat example.lua
cat f.txt >> failed.txt
cat fp2.html >> fp.html
cat github-theme.lua >> init.lua
cat headers.lua
cat index.html >> /sdcard/in.html
cat init.lua >> mocha.lua
cat init.lua >> treesitter.lua
cat install.sh
cat lic > /sdcard/lic
cat luasnip.lua >> blink.lua
cat mason-lspconfig.lua >> mason.lua
cat nvim-lsp-config.lua >> lsp.lua
cat nvim-treesitter.lua >> init.lua
cat o07.lua >> o01.lua 
cat options.lua >> options2.lua
cat pip.conf.orig >> pip.conf
cat py.txt >> readme.md
cat readme.md
cat requirements.txt
cat requirements.txt 
cat s.py >> __init__.py
cat t1.json >> t2.json
cat tags
cat template >> q9
cat tree.txt
cat upgrade.txt 
cat urls.txt >> /sdcard/data/urls.txt
cat urlzz.txt >>urls.txt
cat ~/requirements.txt
cat ~/t.py >> t.py
cc
cc .libs
cc 2k-24k/
cc Contributed/
cc config/
cc css
cc dist/
cc dup_folders/
cc en
cc ext
cc google_ai_generativelanguage-0.12.0/
cc gumbo-parser/
cc jaraco/
cc jpg
cc lang
cc lspconfigc
cc lua
cc lunarvim/
cc mason
cc mhtml/
cc mupdf-1.26.10-source
cc nvim-astrovim/
cc nvim/lszy
cc pdf
cc plugin
cc plugind
cc plugins/
cc ppdeep/
cc pymupdf-1.26.5/
cc pypdfium2/
cc python_template_project-0.2.4/
cc ruby-build/
cc shfmt
cc src
cc subtitle/
cc t01
cc test/
cc thirdparty/
cc unit/
cc util/
ccsa
ccss
ccss extra.css
cd
cd 
cd  scripts/
cd  share
cd "`printf '%b' '\0057data\0057data\0057com\0056termux'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057cache'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057crontab'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057dirb'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057dirb\0057resume'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057fissix'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057gh'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057gh\0057\0056sigstore'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057hatch'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057hatch\0057licenses'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057pip\0057http\0055v2'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057pip\0057selfcheck'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cache\0057pip\0057wheels'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cargo'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056cargo\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057bash\0056d'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057nvim\0055astrovim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057nvim\0057after\0057ftplugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057nvim\0057external'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057nvim\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057nvim\0057lua\0057config'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057nvim\0057lua\0057dpetka2001'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057nvim\0057lua\0057plugins'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056config\0057nvim\0057lua\0057util'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057etc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057include'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057encodings'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057ensurepip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057ensurepip\0057\0137bundled'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057lib\0055dynload'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057bitmath'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057debugpy'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057numpy\00552\00565\00562\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057phuff'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pint\00550\005625\00563\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\005526\00562\00561\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux\0057files'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux\0057files\0057home'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137internal'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137\0137pycache\0137\0137\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137internal\0057build\0137env'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137internal'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137vendor'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137vendor\0057cachecontrol'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137vendor\0057cachecontrol\0057caches'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pip\0057\0137vendor\0057requests'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pyppeteer'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pyppeteer\00552\00560\00560\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057pyproject2setuppy'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057virtualenv'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057virtualenv\0057seed'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057virtualenv\0057seed\0057embed'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057virtualenv\0057seed\0057embed\0057via\0137app\0137data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057virtualenv\0057seed\0057embed\0057via\0137app\0137data\0057pip\0137install'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057virtualenv\0057seed\0057wheels'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057lib\0057python3\005612\0057site\0055packages\0057virtualenv\0057seed\0057wheels\0057embed'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057man'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057man\0057man1'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057base46'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks\0057image\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks\0057image\0056nvim\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks\0057image\0056nvim\0057lib\0057luarocks'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks\0057image\0056nvim\0057lib\0057luarocks\0057rocks\00555\00561'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks\0057image\0056nvim\0057lib\0057luarocks\0057rocks\00555\00561\0057image\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks\0057image\0056nvim\0057lib\0057luarocks\0057rocks\00555\00561\0057image\0056nvim\0057scm\00551'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks\0057image\0056nvim\0057lib\0057luarocks\0057rocks\00555\00561\0057image\0056nvim\0057scm\00551\0057doc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks\0057image\0056nvim\0057lib\0057luarocks\0057rocks\00555\00561\0057magick'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0055rocks\0057image\0056nvim\0057lib\0057luarocks\0057rocks\00555\00561\0057magick\0057dev\00551'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057AstroNvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057Comment\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057LazyVim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057LuaSnip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057LuaSnip\0057deps'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057LuaSnip\0057deps\0057jsregexp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057LuaSnip\0057deps\0057jsregexp005'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057LuaSnip\0057deps\0057jsregexp\0057EmmyLua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057LuaSnip\0057deps\0057jsregexp\0057EmmyLua\0057jsregexp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057LuaSnip\0057deps\0057jsregexp\0057libregexp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057NvChad'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057NvChad\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057NvChad\0057lua\0057nvchad'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057aerial\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057alpha\0055nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057blink\0056cmp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057blink\0056cmp\0057target'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057blink\0056cmp\0057target\0057generated'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057blink\0056cmp\0057target\0057release'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057catppuccin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057copilot\0056vim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057friendly\0055snippets'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057friendly\0055snippets\0057debug'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057indent\0055blankline\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057indent\0137blankline'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057indent\0137blankline\0057\0056git'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057ipybridge\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057ipybridge\0056nvim\0057python'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057ipybridge\0056nvim\0057resources'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057ipybridge\0056nvim\0057resources\0057plot\0137pane'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057molten\0055nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057nvim\0055tree\0056lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057nvim\0055treesitter'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057nvim\0055treesitter\0055textobjects'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057nvim\0055ts\0055autotag'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057project\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057python\0055imports\0056vim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057rainbow\0055delimiters\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057rubiks\0055cube\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057ts\0055comments\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057vim\0055matchup'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057vim\0055matchup\0057after'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057vim\0055matchup\0057after\0057ftplugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057vim\0055matchup\0057after\0057plugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057vim\0055matchup\0057after\0057queries'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057vim\0055matchup\0057after\0057queries\0057python'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057vim\0055resize'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057vim\0055resize\0057plugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057volt'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057lazy\0057vscode\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612\0057site\0055packages'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612\0057site\0055packages\0057debugpy'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612\0057site\0055packages\0057debugpy\00551\00568\005621\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612\0057site\0055packages\0057debugpy\0057\0137vendored'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612\0057site\0055packages\0057debugpy\0057\0137vendored\0057pydevd'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612\0057site\0055packages\0057debugpy\0057adapter'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612\0057site\0055packages\0057debugpy\0057common'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612\0057site\0055packages\0057debugpy\0057launcher'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057debugpy\0057venv\0057lib\0057python3\005612\0057site\0055packages\0057debugpy\0057server'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057pyright'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057pyright\0057node\0137modules'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057pyright\0057node\0137modules\0057\0056bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057pyright\0057node\0137modules\0057pyright'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057python\0055lsp\0055server'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057python\0055lsp\0055server\0057mason\0055schemas'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057python\0055lsp\0055server\0057venv'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057python\0055lsp\0055server\0057venv\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057python\0055lsp\0055server\0057venv\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057python\0055lsp\0055server\0057venv\0057lib\0057python3\005612'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057python\0055lsp\0055server\0057venv\0057lib\0057python3\005612\0057site\0055packages'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057python\0055lsp\0055server\0057venv\0057lib\0057python3\005612\0057site\0055packages\0057whatthepatch\00551\00560\00567\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057ruff'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057shfmt'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057packages\0057stylua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057registries'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057mason\0057share'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057project\0137nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057session'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057site'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057site\0057parser'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057site\0057queries'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056local\0057share\0057nvim\0057snacks'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057api'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057assets'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057assets\0057agents'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057bin\0057darwin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057bin\0057darwin\0057arm64'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057bin\0057linux'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057bin\0057linux\0057arm64'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057bin\0057linux\0057x64'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057\0100microsoft'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057\0100microsoft\0057mxc\0055sdk'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057\0100microsoft\0057mxc\0055sdk\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057\0100microsoft\0057mxc\0055sdk\0057bin\0057x64'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057vscode\0055jsonrpc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057vscode\0055jsonrpc\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057zod'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057zod\0057mini'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057zod\0057v4'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057node\0137modules\0057zod\0057v4\0055mini'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057policy\0055templates'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056npm\0057\0137npx\0057cf9b4eea2397642a\0057node\0137modules\0057\0100github\0057copilot\0055language\0055server\0057dist\0057resources'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions\00572\005617\005618'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions\00572\005617\005618\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions\00572\005617\005618\0057include'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions\00572\005617\005618\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions\00572\005617\005618\0057lib\0057pkgconfig'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions\00572\005617\005618\0057lib\0057python2\00567'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions\00572\005617\005618\0057lib\0057python2\00567\0057site\0055packages'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions\00572\005617\005618\0057lib\0057python2\00567\0057site\0055packages\0057backports'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056pyenv\0057versions\00572\005617\005618\0057lib\0057python2\00567\0057site\0055packages\0057backports\0057configparser'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056termux'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056termux\0055build'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056termux\0055build\0057xcb\0055proto\0057cache\0057xcb\0055proto\00551\005617\00560'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057\0056translate'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057bashbin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057bashbin\0057fstool'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057downloads'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057api\0137key'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057cpp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057isaac\0057may\0057add\0137type\0137hints'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057nltk\0137data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057nltk\0137data\0057corpora'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057nltk\0137data\0057tokenizers'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057awesome\0055neovim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057cpp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057cpp\0057cleanup'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057cpp\0057ddd'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057cpp\0057dmp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\005791k\0055229k'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057AstroNvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057AstroNvim\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057AstroNvim\0057lua\0057astronvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057LazyDeveloperHelper'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057LazyDeveloperHelper\0057plugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057LazyDeveloperHelper\0057sh\0137scripts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057LazyDeveloperHelper\0057test\0137files'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057LazyDeveloperHelper\0057test\0137files\0057test\0137pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057LazyDeveloperHelper\0057test\0137files\0057test\0137poetry'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057LazyDeveloperHelper\0057tools'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057LuaSnip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057NvChad'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057NvChad\0057examples'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057Tide\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057Tide\0056nvim\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057astrotheme'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057astrotheme\0057extras'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057astrotheme\0057extras\0057aerc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057astrotheme\0057extras\0057foot'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057astrotheme\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057astrotheme\0057lua\0057astrotheme'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057base46'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057edge'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057edge\0057autoload'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057edge\0057colors'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057edge\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057edge\0057lua\0057lualine'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057edge\0057lua\0057lualine\0057themes'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057github\0055nvim\0055theme'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057github\0055nvim\0055theme\0057autoload'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057github\0055nvim\0055theme\0057colors'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057github\0055nvim\0055theme\0057doc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057github\0055nvim\0055theme\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057github\0055nvim\0055theme\0057lua\0057github\0055theme'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057github\0055nvim\0055theme\0057plugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057github\0055nvim\0055theme\0057scripts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057heirline\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057lspsaga\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057neodev\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057neopyter'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow2'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow2\0057\0056gitlab'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow\0057LICENSES'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow\0057\0056git'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow\0057\0056git\0057modules'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow\0057\0056git\0057modules\0057\0056luals'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow\0057\0056git\0057modules\0057\0056luals\0057addons'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow\0057\0056git\0057modules\0057\0056luals\0057addons\0057busted'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow\0057\0056git\0057modules\0057\0056luals\0057addons\0057luassert'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow\0057\0056git\0057modules\0057test'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057rainbow\0057\0056luals'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057lua\0057themes'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057\0056ai'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057\0056ai\0057rules'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057assets'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057autocmd'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057keymaps'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057lazy'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057lua\0057config'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057lua\0057plugins'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057options'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057options\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057plugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057queries'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057queries\0057c3'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057resources'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057scripts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057snapshots'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057snippets'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057spell'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057syntax'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057tests'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057tests\0057lvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057tests\0057specs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057utils'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057utils\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057utils\0057ci'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057utils\0057desktop'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057utils\0057installer'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00570\0057vimscript'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00571'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\005710'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00572'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00573'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00574'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00575'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00575\0057splitted'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00576'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00577'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00578'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\00579'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057Usuim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057after'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057claude'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057claude\0057pyproject2setuppy\005522\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057colorful\0055menu\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057doc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057dot1'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057dot1\0057no\0137extension'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057dot1\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057dot1\0057py'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057felo'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057felo\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057harrison'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057lang'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057lvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057main'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057mistral'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057mistral\0057plugins'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057morpheoslord'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057morpheoslord\0057demo'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057my\0137nvim\0137config'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057my\0137nvim\0137config\0057assets'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057my\0137nvim\0137config\0057colors'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057my\0137nvim\0137config\0057spell'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057neodots'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057neovim\0055config\0055master'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057neovim\0055config\0055master\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057neovim\0055config\0055master\0057lua\0057core'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057neovim\0055config\0055master\0057lua\0057core\0057packer\0137config'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057new'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvchad'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim1'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim3'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055alexis'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055astrovim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055codeart'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055gorilla'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055kickstart'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057\0056linter\0137configs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057\0137data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057\0137plugins'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057\0137tabs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057assets'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057astrocommunity'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057astrocommunity\0057user'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057astrocommunity\0057user\0057plugins'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057scripts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055lazyman\0057scripts\0057figlet\0055fonts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055nvchad'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055nvimesle\0055adamizad'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055nxvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0055pysys'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0056bak'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\01371\0056bak'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0137bash'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0137bash\0057extracted\0137functions'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0137config'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0137config\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0137trend'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0137trend\0057envim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057neo\0137vim\0057nvim\0137trend\0057envim\0057python'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057prettier'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057prettier\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057prettier\0057tests'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057prettier\0057v1'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057prettier\0057v2'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057pyprettier'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057pyprettier\0057pyprettier'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057svgo\0057src\0057svgo'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057svgo\0057src\0057svgo\0057pyprettier'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057svgo\0057src\0057svgo\0057pyprettier\0057pyprettier'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057zoxide'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057zoxide\0057src'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057zoxide\0057src\0057zoxide'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057zoxide\0057zoxide'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057zoxide\0057zoxide\0057src'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057py\0057zoxide\0057zoxide\0057src\0057zoxide'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057scripts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057themes'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057projects\0057themes\0057edge'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057llvmlite\00550\005649\00560'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057llvmlite\00550\005649\00560\0057ffi'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057llvmlite\00550\005649\00560\0057ffi\0057build'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057llvmlite\00550\005649\00560\0057llvmlite'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057llvmlite\00550\005649\00560\0057llvmlite\0057\0137\0137pycache\0137\0137'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057llvmlite\00550\005649\00560\0057llvmlite\0057binding'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057llvmlite\00550\005649\00560\0057llvmlite\0057ir'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057llvmlite\00550\005649\00560\0057llvmlite\0057tests'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057mupdf'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057mupdf\00551\005626\005610\0055source'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057mupdf\00551\005626\005610\0055source\0057generated'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057mupdf\00551\005626\005610\0055source\0057generated\0057resources'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057mupdf\00551\005626\005610\0055source\0057generated\0057resources\0057fonts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057mupdf\00551\005626\005610\0055source\0057generated\0057resources\0057fonts\0057urw'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057mupdf\0057include'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057mupdf\0057include\0057mupdf'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057pymupdf\00551\005626\00565'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057pymupdf\00551\005626\00565\0057mupdf\00551\005626\005610\0055source'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057pymupdf\00551\005626\00565\0057mupdf\00551\005626\005610\0055source\0057thirdparty\0057gumbo\0055parser'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057pymupdf\00551\005626\00565\0057mupdf\00551\005626\005610\0055source\0057thirdparty\0057gumbo\0055parser\0057\0056libs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057pymupdf\00551\005626\00565\0057mupdf\00551\005626\005610\0055source\0057thirdparty\0057mujs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057pymupdf\00551\005626\00565\0057mupdf\00551\005626\005610\0055source\0057thirdparty\0057mujs\0057build'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057pymupdf\00551\005626\00565\0057mupdf\00551\005626\005610\0055source\0057thirdparty\0057mujs\0057tools'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057pypdfium2\00554\005618\00560'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057tree\0055sitter\0055css'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057tree\0055sitter\0055css\0057queries'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\00570\0057tree\0055sitter\0055rust\0055master'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057body'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057body\0057PyMuPDF\00551\005616\005614'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057body\0057PyMuPDF\00551\005616\005614\0057fitz'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cc\0055\0052'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cc\0055hypermodern'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cc\0055hypermodern\0057\0173\0173cookiecutter\0056project\0137name\0175\0175'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cc\0055hypermodern\0057\0173\0173cookiecutter\0056project\0137name\0175\0175\0057\0056github'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cc\0055hypermodern\0057\0173\0173cookiecutter\0056project\0137name\0175\0175\0057src'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cc\0055hypermodern\0057\0173\0173cookiecutter\0056project\0137name\0175\0175\0057src\0057\0173\0173cookiecutter\0056package\0137name\0175\0175'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cc\0055hypermodern\0057docs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cc\0055hypermodern\0057hooks'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cc\0055hypermodern\0057tools'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cld3'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057compressedcrack'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057contrib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057cv2'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057alacritty'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057dunst'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057mine'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057ncmpcpp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057ncmpcpp\0057ncmpcpp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057nvim\0057after'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057nvim\0057after\0057queries'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057nvim\0057after\0057queries\0057markdown'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057nvim\0057after\0057queries\0057ruby'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057nvim\0057ftplugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057nvim\0057lsp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056config\0057nvim\0057plugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057\0056docker'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057bash\0056d'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137file\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057dot\0137filez'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057download'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057minify\0137html\00550\005618\00561'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057downloads\0057mypy\00552\00563\00561'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057ethical'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057ethical\0057SecurityTools'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057ethical\0057SecurityTools\0057alexaportscanner'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057fslint'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057fslint\0057debian'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057fslint\0057doc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057fslint\0057fslint'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057ir\0055ip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\005710'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\005711'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\00579'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057after'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057after\0057ftplugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvchad'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0055alexis'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0055alexis\0057installer'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0055alexis\0057snippets'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0055astrovim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0055astrovim\005711'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0055astrovim\005711\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0055astrovim\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0057lua\0057config'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0057lua\0057plugins'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0057lua\0057plugins\0057extra'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057nvim\0057lua\0057plugins\0057extra\0057lang'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057neo\0137vim\0057themes'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057persian'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pip\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pip\0057pip260'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pip\0057pip260\0057pip\005526\00560\00561\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pip\0057pip262'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pip\0057pip262\0057pip\005526\00562\00561\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pip\0057pip\0057\0137internal'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pip\0057pip\0057\0137internal\0057commands'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pwords\00570\0057json'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pwords\0057hunspell'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pwords\0057words'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pychm'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pychm\0057v1'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pychm\0057v2'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycmd\0055fork'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto\0057Demo'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto\0057Doc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto\0057Hash'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto\0057LEGAL'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto\0057Protocol'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto\0057\0056venv'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto\0057\0056venv\00572\00567\005618'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto\0057\0056venv\00572\00567\005618\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pycrypto\0057\0056venv\0057the\0055big\0055book\0055of\0055small\0055python\0055projects\0055main'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pymupdf'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pypackage'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pypackage\0057\0173\0173cookiecutter\0056package\0137name\0175\0175'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pypackage\0057docs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pypackage\0057hooks'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pypackage\0057scripts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pypackage\0057src'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057pypackage\0057src\0057cookiecutter\0137pypackage'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057scripts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057site'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057site\0057harrisoncramer\0056me'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057site\0057sebsite\0056pw'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057site\0057sebsite\0056pw\005788x31'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057site\0057sebsite\0056pw\0057w'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057site\0057sebsite\0056pw\0057w\0057mashups'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057trend'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057trend\0057jupyter'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057trend\0057jupyter\0057output'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057trend\0057jupyter\0057output\00572015'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057trend\0057jupyter\0057output\00572017'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057trend\0057python'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147\0057awesome\0055neovim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147\0057awesome\0055neovim\0057nvim\0055kickstart\0055python'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147\0057awesome\0055neovim\0057nvim\0055kickstart\0055python\0057doc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147\0057awesome\0055neovim\0057nvim\0055kickstart\0055python\0057treesitter\0055vs\0055semshi'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147\0057awesome\0055neovim\0057scripts'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147\0057ipybridge\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147\0057jupynium\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147\0057neopyter'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057repos\0057unforgivenii147\0057nvim\0055kickstart\0055python'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057Download'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057Download\0057txt'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057storage\0057shared\0057MxPlayerPro'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057test'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\00570\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib\0057python3\005612'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\00570\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib\0057python3\005612\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\00570\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib\0057python3\005612\00570\0057tiktoken\00550\005612\00560\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\00570\0057skimage'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\00570\0057skimage\0057scikit\0137image\00550\005625\00562\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\00570\0057skimage\0057skimage'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\0057nvim\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\0057nvim\0057lua\0057config'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\0057nvim\0057lua\0057dpetka2001'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\0057nvim\0057lua\0057plugins'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\0057nvim\0057lua\0057plugins\0057extras'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\0057nvim\0057lua\0057plugins\0057extras\0057lang'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\00571\0057nvim\0057lua\0057util'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057\0056whl'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057apps'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057blink'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057blink\0056cmp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057blink\0056cmp\0057target'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057blink\0057release'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057css'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data\0057data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data\0057data\0057com\0056termux'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data\0057data\0057com\0056termux\0057files'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data\0057data\0057com\0056termux\0057files\0057usr'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data\0057data\0057com\0056termux\0057files\0057usr\0057include'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib\0057cmake'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib\0057cmake\0057absl'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057abseil\0055cpp\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib\0057pkgconfig'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057libprotobuf'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057libprotobuf\0057data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057libprotobuf\0057data\0057data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057libprotobuf\0057data\0057data\0057com\0056termux'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057libprotobuf\0057data\0057data\0057com\0056termux\0057files'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057libprotobuf\0057data\0057data\0057com\0056termux\0057files\0057usr'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057libprotobuf\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057libprotobuf\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib\0057pkgconfig'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057protobuf'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057protobuf\0057data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057protobuf\0057data\0057data'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057protobuf\0057data\0057data\0057com\0056termux'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057protobuf\0057data\0057data\0057com\0056termux\0057files'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057protobuf\0057data\0057data\0057com\0056termux\0057files\0057usr'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057deb\0057protobuf\0057data\0057data\0057com\0056termux\0057files\0057usr\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057html'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057html\0057sebsite\0056pw'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057log'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057log\0057apps'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057misc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057output'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057output\0057constant'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057p'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057p\0057projects'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057p\0057projects\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057p\0057projects\0057lua\0057copilot\0056vim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057p\0057projects\0057lua\0057edge'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057p\0057projects\0057neo\0137vim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057packages'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057packages\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pip\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pip\00570\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pip\00570\0057pip\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pip\00570\0057pip\0057pip\005526\00562\00561\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pip\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pip\0057pip\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pip\0057pip\0057pip\005526\00562\00561\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pylibmspack\00550\00564\00560\0057dist'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pylibmspack\00550\00564\00560\0057dist\0057pylibmspack'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pylibmspack\00550\00564\00560\0057dist\0057pylibmspack\0057pylibmspack'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pylibmspack\00550\00564\00560\0057dist\0057pylibmspack\0057pylibmspack\0057\0056libs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pylibmspack\00550\00564\00560\0057dist\0057pylibmspack\0057pylibmspack\0057vendor'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057pylibmspack\00550\00564\00560\0057dist\0057pylibmspack\0057pylibmspack\0057vendor\0057libmspack\00550\005611alpha'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057py'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057speedtest\0055cli\00552\00561\00563'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057speedtest\0055cli\00552\00561\00563\0057build'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057speedtest\0055cli\00552\00561\00563\0057dist'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057tree\0137sitter\0137language\0137pack\00551\005616\00561'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057tree\0137sitter\0137language\0137pack\00551\005616\00561\0057crates'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057tree\0137sitter\0137language\0137pack\00551\005616\00561\0057crates\0057ts\0055pack\0055core\0055py'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057tree\0137sitter\0137language\0137pack\00551\005616\00561\0057crates\0057ts\0055pack\0055core\0055py\0057src'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057tree\0137sitter\0137language\0137pack\00551\005616\00561\0057crates\0057ts\0055pack\0055core\0055py\0057src\0057tree\0137sitter\0137language\0137pack'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057tree\0137sitter\0137language\0137pack\00551\005616\00561\0057tree\0137sitter\0137language\0137pack'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057workspace'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057test\0057workspace\0057dist'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570\0057pypdfium2'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570\0057pypdfium2\0057pypdfium2'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570\0057pypdfium2\0057pypdfium2\00555\005613\00560\0056dist\0055info'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570\0057pypdfium2\0057pypdfium2\00555\005613\00560\0056dist\0055info\0057sboms'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570\0057pypdfium2\0057pypdfium2\0056libs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570\0057pypdfium2\0057pypdfium2\0137cfg'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570\0057pypdfium2\0057pypdfium2\0137cfg\0057\0137shared'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570\0057pypdfium2\0057pypdfium2\0137cli'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\00570\00570\0057pypdfium2\0057pypdfium2\0137raw'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563\0057tools'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563\0057vendor'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563\0057vendor\0057llhttp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563\0057vendor\0057llhttp\0055release\0055v8\00561\00560'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563\0057vendor\0057llhttp\0055release\0055v8\00561\00560\0057include'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563\0057vendor\0057llhttp\0055release\0055v8\00561\00560\0057src'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563\0057vendor\0057llhttp\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563\0057vendor\0057llhttp\0057build'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057aiohttp\00553\005614\00563\0057vendor\0057llhttp\0057build\0057c'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057gz\0057arena\0055cli\00551\00567'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057gz\0057arena\0055cli\00551\00567\0057output'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057gz\0057arena\0055cli\00551\00567\0057output\0057function'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057hello\0137agents\00551\00560\00560'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057hello\0137agents\00551\00560\00560\0057examples'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057hello\0137agents\00551\00560\00560\0057examples\0057custom\0137tools'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057pip\0057pip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057pip\0057pip\0057\0137vendor'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057tgz\0057pip\0057pip\0057\0137vendor\0057platformdirs'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057z'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057z\0057zip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057z\0057zip\0057recursiv'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057z\0057zip\0057recursiv\01371'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057z\0057zip\0057recursiv\01372'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057z\0057zip\0057recursiv\01373'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057z\0057zip\0057recursiv\01374'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057zip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057zip\0057conf'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057zip\0057conf\0057repo'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057zip\0057dotfiles'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057zip\0057dotfyle\0137cli'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057zip\0057dots\0056nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057zip\0057dots\0056nvim\0057colors'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057zip\0057kodo'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057tmp\0057zip\0057nvim\0055astrovim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057typings'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057venv'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057venv\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057venv\0057lib\0057python3\005612'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057home\0057venv\0057lib\0057python3\005612\0057site\0055packages'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057bin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057lib'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057examples'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057ffmpeg'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057man'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057man\0057man'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057autoload'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057colors'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057lua'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057lua\0057nvim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057lua\0057nvim\0057dir'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057lua\0057nvim\0057zip'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057lua\0057uv'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057lua\0057vim'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057lua\0057vim\0057\0137ftplugin'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057lua\0057vim\0057lsp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057share\0057nvim\0057runtime\0057parser'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057node\0055compile\0055cache'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055388f1em2'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055388f1em2\0057zope\0055interface\01379c24f2ee435e4a999ba943cd3644d6cc'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\005584pfr8x5'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\00558csbkc8i'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055bgj9bpyw'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055bk0749sw'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055bk0749sw\0057librt'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055cnyfersw'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055hnsidhp2'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055hnsidhp2\0057gumbo\013737cbf324e09c49b88c55a8dfb7492a3c'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055i\01371wbj8b'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055jab9h5pt'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055jab9h5pt\0057ninja\01372179cffe9e764d348db367763bac90a3'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055jab9h5pt\0057ninja\01372179cffe9e764d348db367763bac90a3\0057ninja\0055upstream'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055jf6ycgg7'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055kkourrsb'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055kkourrsb\0057pygit2\01377bfce5797c33487bb52ac52e042f449b'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055kkourrsb\0057pygit2\01377bfce5797c33487bb52ac52e042f449b\0057src'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055kkourrsb\0057pygit2\01377bfce5797c33487bb52ac52e042f449b\0057test'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055ono6wq8e'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055s9wb35f7'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055tbe5r9fl'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055tbe5r9fl\0057maturin\0137d1d057079a9b4a01bd04ac1a6b8b5cc8'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055vq5in2bo'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055vy\013784wcx'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055w2bk8u0b'`"
cd "`printf '%b' '\0057data\0057data\0057com\0056termux\0057files\0057usr\0057tmp\0057pip\0055install\0055yn18epfz'`"
cd "`printf '%b' '\0057sdcard'`"
cd "`printf '%b' '\0057sdcard\0057DCIM'`"
cd "`printf '%b' '\0057sdcard\0057DCIM\0057assets'`"
cd "`printf '%b' '\0057sdcard\0057Download'`"
cd "`printf '%b' '\0057sdcard\0057Download\0057apk'`"
cd "`printf '%b' '\0057sdcard\0057Download\0057gz'`"
cd "`printf '%b' '\0057sdcard\0057Download\0057json'`"
cd "`printf '%b' '\0057sdcard\0057Download\0057mht'`"
cd "`printf '%b' '\0057sdcard\0057Download\0057mhtml'`"
cd "`printf '%b' '\0057sdcard\0057Subtitles'`"
cd "`printf '%b' '\0057sdcard\0057Subtitles\0057s11'`"
cd "`printf '%b' '\0057sdcard\0057Subtitles\0057silo'`"
cd "`printf '%b' '\0057sdcard\0057\0137static'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057css'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057css\0057html'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057css\0057html\0057css'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057css\0057html\0057css\0057extracted\0137base64'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057extracted\0137base64'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057extracted\0137base64\0057woff2'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057fonts'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057html'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057html\0057html'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057html\0057mht'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057html\0057mht\0057mhr'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057html\0057mht\0057misc'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057html\0057misc'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057html\0057zip'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057jup\0137trend'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057stylesheets'`"
cd "`printf '%b' '\0057sdcard\0057\0137static\0057weasyprint'`"
cd "`printf '%b' '\0057sdcard\0057backups'`"
cd "`printf '%b' '\0057sdcard\0057backups\0057js'`"
cd "`printf '%b' '\0057sdcard\0057backups\0057sqlite'`"
cd "`printf '%b' '\0057sdcard\0057backups\0057ttf'`"
cd "`printf '%b' '\0057sdcard\0057dcim\0057assets'`"
cd "`printf '%b' '\0057sdcard\0057font'`"
cd "`printf '%b' '\0057sdcard\0057font\0057ttf'`"
cd "`printf '%b' '\0057sdcard\0057font\0057txt'`"
cd "`printf '%b' '\0057sdcard\0057font\0057woff2'`"
cd "`printf '%b' '\0057sdcard\0057series'`"
cd "`printf '%b' '\0057sdcard\0057series\0057srt'`"
cd "`printf '%b' '\0057sdcard\0057summa'`"
cd "`printf '%b' '\0057sdcard\0057whl'`"
cd "`printf '%b' '\0057storage\0057emulated\00570\0057\0137static\0057extracted\0137base64'`"
cd "`printf '%b' '\0057storage\0057emulated\00570\0057\0137static\0057extracted\0137base64\0057css'`"
cd "`printf '%b' '\0057storage\0057emulated\00570\0057\0137static\0057extracted\0137base64\0057formula\0055template'`"
cd "`printf '%b' '\0057storage\0057emulated\00570\0057\0137static\0057extracted\0137base64\0057html'`"
cd -
cd ..
cd ../config/
cd ../plugins/
cd ../repos/0/pywavelets-1.9.0/
cd ../usr
cd .bin
cd .cache
cd .cache/
cd .cache/pip
cd .cachr
cd .cacje
cd .cargo
cd .cargo/
cd .cargo/registry/src/index.crates.io-1949cf8c6b5b557f/
cd .conf8g
cd .config
cd .config/
cd .deps
cd .egg
cd .felo/
cd .git
cd .github/
cd .libs
cd .local
cd .local/share/
cd .local/share/nvim
cd .luals
cd .npm
cd .npm-global/
cd .npm-global/lib/node_modules/
cd .pyenv/
cd .ropeproject/
cd .termux
cd .termux-build/
cd .termux/
cd .vim
cd .whl
cd /system
cd 0
cd 0c
cd 1
cd 10k-77k/
cd 11
cd 122k-10M/
cd 122k-161k/
cd 13
cd 170k-284k/
cd 18
cd 2
cd 2.7.18/
cd 2.7.18/lib/
cd 2008
cd 2009
cd 2010
cd 2011
cd 2012
cd 2013
cd 2014
cd 2015
cd 2016
cd 2017
cd 2018
cd 2019
cd 2020
cd 2021
cd 2022
cd 2023
cd 2024
cd 2025
cd 2026
cd 214B-85k/
cd 238k-624k/
cd 24k-37k/
cd 2k-24k/
cd 5
cd 500k-10M/
cd 60k-2M/
cd 628k-35M/
cd 720
cd 77k-122k/
cd 7z
cd @esbuild/
cd @github/
cd AntiyPasswordMixer/
cd CHMLib/
cd CPython-312-33/
cd Comment.nvim/
cd Contributed/
cd DCIM/
cd DOC/
cd Download/
cd Examples/
cd LC_MESSAGES/
cd LazyDeveloperHelper/
cd LazyVim
cd LazyVim/
cd Lib/robofab/objects/
cd LuaSnip/
cd Notepad/
cd NvChad/
cd PY3/
cd PyMuPDF-1.16.14/
cd RoboFabIntro/
cd SampleTree/
cd Screenshots/
cd Scripts/
cd Tide.nvim/
cd \{\{cookiecutter.package_name\}\}/
cd _
cd __pycache__
cd __pycache__/
cd _bundled/
cd _bundles/
cd _cacache/
cd _click/
cd _core/
cd _cython/
cd _internal/
cd _internal/commands/
cd _npx/
cd _s
cd _static
cd _static/
cd _static/html
cd _vendor/
cd a
cd absl/
cd accident_manager_service/
cd adaptive_compliance_policy/
cd add_type_hints/
cd addons/
cd after
cd after/
cd after/lsp/
cd aiohttp
cd aiohttp-3.14.3/
cd aiohttp-3.9.5/
cd alpha-nvim/
cd ancient/
cd android-arm/
cd api
cd api_key/
cd apk
cd app
cd apps
cd apps/
cd apt/
cd apt/archives/
cd archive_utils/
cd archives/
cd arena
cd arena-cli-1.7/
cd arena/
cd arsc/
cd aspell
cd assets/
cd ast-serialize_394067b33224416d8331d15cf8cbeaca/
cd astronvim/
cd august/
cd auto_git_fmt/
cd auto_git_push
cd auto_git_push/
cd auto_tor_ip_change/
cd autoimport_json/
cd autoload/
cd autovenv-3.12.12-32/
cd awesome-neovim/
cd b
cd babel
cd backup/
cd backups/
cd base46/
cd bash
cd bash.d
cd bash.d/
cd bash_completion.d/
cd bashbin
cd bashbin/
cd battle_mod/
cd bb
cd bee
cd bench
cd bench/
cd benchmarks/
cd big
cd bim
cd bin
cd bin'
cd bin/py
cd bin_sep
cd bin_sep/
cd binaryornot
cd binaryornot-0.4.4.dist-info/
cd binaryornot/
cd binding/
cd bindings/
cd bindings/python/
cd biuld
cd blink.cmp
cd blink.cmp/
cd bmp
cd body
cd boo
cd book
cd bot/
cd brotli/
cd brute
cd buid_cross/
cd build
cd build/
cd bundle/
cd busted/
cd c
cd c5/65/a63728f83cfe93b60c353d30fab199d646305b15fa5c117bea/
cd cache
cd cache/
cd cache/apt
cd cache/apt/archives/
cd cairosvh
cd catppuccin/
cd cc-minimal/
cd cc-pypkg
cd cchardet-2.2.0a2/
cd cf9b4eea2397642a/
cd cffi_ff13ad32632441c4805f8fdfdd1b3348/
cd chinese_files/
cd chm
cd chmlib-master/
cd chmlib-sys/
cd chttp2/
cd cilantro-code-mono/
cd class
cd classes/
cd claude/
cd claudec/
cd cld
cd cld3
cd cld3/
cd clean-css-cli/
cd cli
cd cmake/
cd cmake443/
cd cmake_5fe3225f8f3b40dba48ce090261a8753/
cd cmap
cd cmatrix/
cd cmp-path
cd cmp_openai/
cd codediff.nvim/
cd codeslim/
cd coding-agent-sft-lab/
cd coding/
cd colorful-menu.nvim/
cd colorful-menu/
cd colors/
cd colorscheme/
cd colorschemes/
cd commands/
cd community/
cd completion/
cd components/
cd compressedcrack/
cd concurrent/
cd conf
cd conf8g
cd config
cd config/
cd configs/
cd conform.nvim/
cd constant/
cd constants/
cd content-v2/
cd contrib/
cd cookiecutter
cd cookiecutter-hypermodern-python/
cd cookiecutter-pypackage
cd copilot-language-server/
cd copilot.vim/
cd copilot/
cd core
cd core/
cd corpora/words
cd cpp
cd cppyy-backend_0bf460159cbd42af8d062b380cf0cc6e/
cd cppyy-cling_785759a6de824fcba44501a690e3a44c/
cd cramjam
cd cramjam-2.12.1/
cd cramjam/
cd crypt
cd crypt/
cd crypto
cd crypto/
cd cryptography-50.0.1/
cd cryptography/
cd cryptography_631c3f3bdc6e40b187e2d59fcab1f201/
cd cspell/
cd css
cd csz
cd curl
cd custom/
cd cv2/
cd cxx-patches/
cd cython
cd d
cd dagmap/
cd dap
cd data
cd data/
cd data/com.termux/files/home/
cd data/data/com.termux/files/
cd data/data/com.termux/files/usr/
cd data/quotes/
cd db
cd dc/1a/ad/aa3fadc1c0e13121cb151168533c244c85237d67de07877ff6/
cd dcim
cd ddd
cd deb
cd debian
cd debian/
cd debug/
cd debugpy/
cd demo
cd deps
cd deps/
cd deptree
cd dh
cd dictionaries/
cd diff
cd disabled-packages/
cd dist
cd dist/
cd distro/
cd disy
cd doc
cd docopt
cd docs
cd document_manager_service/models/
cd domain-paas-sdk-python-1.0.7/
cd done
cd dot_file
cd dot_filez
cd dotfiles
cd dotfiles/
cd downloads/
cd downloads/grpc/
cd dpetka2001/
cd dpkg
cd dup_folders/
cd dutree_0dcd5dee6d794299a49bad3876f4c6b8/
cd e
cd edge
cd edhe
cd electron-host-tools-for-code-oss/
cd embed/
cd embedded-book/
cd ember
cd en
cd ensurepip/
cd error/
cd esbuild/
cd etc
cd ethical/
cd example/
cd examples/
cd ext
cd extract/
cd extracted_base64/
cd extracted_code/
cd extractors/
cd f
cd fa
cd fabric/
cd faprint/
cd faspell
cd faspell-0.1.1.dist-info/
cd faspell/
cd fastwalk
cd fastwalker/
cd felo-ai/
cd ffi
cd fh8
cd fileintegrity/
cd fileutils/
cd fitz
cd fitz/
cd flake8
cd flake8-use-fstring_e624401b0a1442ffb811a2d44bfef0c9/
cd flake8_logging_format-2024.24.12.dist-info/
cd flakeheaven
cd flakeheaven-3.3.0
cd flakeheaven-3.3.0.dist-info/
cd flakehell/
cd floobits-neovim/
cd floobits/
cd font
cd font/
cd fonts
cd fonts/
cd fonttools
cd fonttools-4.63.0.dist-info/
cd free-llm-api-resources/
cd fslint/
cd fstool/
cd ftdetect/
cd ftplugin/
cd func/
cd function/
cd functions/
cd futures/
cd fuzz
cd fzf-lua/
cd g
cd galata/
cd gapic/
cd gast
cd gcld3/
cd gemini
cd gemini/
cd generativelanguage_v1
cd gensim-3.8.3/
cd gevent-26.8.0/
cd gevent_docs/
cd git_analizer/
cd github/
cd glance.nvim/
cd google/
cd google_ai_generativelanguage-0.12.0.dist-info/
cd google_ai_generativelanguage-0.12.0/
cd greenlet-3.5.5/
cd grpc
cd grpc/
cd grpcio
cd grpcio-1.83.1/
cd grpcio_admin/
cd grug-far.nvim/
cd gumbo-parser/
cd gumbo/
cd gyp
cd gz
cd h
cd hack
cd hammerspoon/
cd harrison/
cd hatch-1.18.0.dist-info/
cd hatch/
cd hazmat/
cd htm
cd html
cd html-minifier
cd html-minifier-terser/
cd html-to-markdown/
cd html-to-markdown_d59fdf476f6849f28a07694b329b885b/
cd html/
cd html5lib-1.1/
cd html_to_text-1.0.0/
cd htmlminify.py/
cd http-v2/
cd huf
cd hunspell-1.2.15/
cd hunspell/
cd i686-linux-android/
cd identity_service/
cd idna
cd images/
cd img2art-0.4.3.dist-info/
cd img2art/
cd import
cd include
cd include/
cd indent-blankline.nvim/
cd indent_blankline/
cd index-v5/
cd index.crates.io-1949cf8c6b5b557f/
cd info
cd inlude
cd installer-1.0.1/
cd installer/
cd internal/
cd interpreters/
cd invlude
cd ipybridge.nvim/
cd ipybridge/
cd ir
cd ir-ip/
cd isaac
cd isaac/pkgs
cd jamfile-engine-1.0.3/
cd jaraco/
cd jaraco_packaging-10.4.0.dist-info/
cd java-26-openjdk/
cd javascript/
cd jedi
cd jedi/
cd jfc
cd jiter-0.16.0/
cd joblib
cd jpg
cd js
cd js-beautify/
cd js/
cd json
cd json/
cd json_prettifier
cd json_prettifier/
cd jsregexp
cd jsregexp/
cd jsregexp005
cd jsregexp006
cd jublib
cd jubyter
cd jupyter/
cd jupyterlab
cd jupyterlab-4.6.3/
cd jvm
cd kite-http
cd kociemba
cd kociemba_4a696261d4d2415bbf662e10308a9eb3/
cd l
cd l8b
cd l9g
cd lang
cd langdet
cd langdet/
cd langdetect-1.0.9/
cd lazy
cd lazy.nvim
cd lazy.nvim/
cd lazy.vim
cd lazy/
cd lazy/config
cd lcms2/
cd learn/
cd lib
cd lib/
cd lib/node_modules/
cd lib/python3.12/
cd lib/python3.12/site-packages/
cd lib/python3.12/site-packages/pip
cd lib_doc/
cd libcst
cd libcst/
cd libcst_1b39614cc4e745f285bc7509f844c612/
cd libexec/
cd librt-0.15.0/
cd librt/
cd libscanbuild/
cd lingua
cd lingua-4.16.2/
cd lingua/
cd linting/
cd linux
cd llhttp-release-v8.1.0/
cd llhttp/
cd llm
cd llvmlite-0.49.0/
cd llvmlite/
cd locales/
cd log
cd logging_format/
cd logs
cd loki-0.5.6/
cd lp
cd lsp
cd lspconfigc
cd lua
cd lua-language-server/
cd lua/config
cd lua/config/
cd lua/core
cd lua/lazy/
cd lua/lazy/config
cd lua/lazy/manage/task/
cd lua/lazyvim/
cd lua/lazyvim/plugins/extras/
cd lua/plugins/
cd lua/vim
cd lunarvim/
cd lvim
cd lvim/
cd lya
cd lzma
cd lzma_mt
cd m
cd magma-nvim/
cd main
cd malbo_fslint/
cd mame4all_2.5/
cd man
cd man1
cd man1/
cd man3
cd mann
cd marked/
cd mashups01.html/
cd mason
cd mason-org/
cd mason.nvim/
cd mason/
cd may/brute/
cd md
cd mechanize/
cd media/
cd merged/
cd metadata/
cd mhr
cd mhr/
cd mht
cd mhtml
cd mhtml-to-html/
cd mhtml/
cd minify
cd minify/
cd minify_html
cd minify_html-0.18.1.dist-info/
cd minify_html-0.18.1/
cd minify_html/
cd misc
cd mistral/
cd mixed-segdec-net-comind2021/
cd mo 
cd models/
cd modules
cd modules/
cd mozilla/
cd mprun/
cd mu
cd mujs
cd multiprocessing/
cd mupdf
cd mupdf-1.26.10-source/
cd mupdf/
cd my-ip-0.2.1/
cd myPackage/
cd my_ip/
cd my_snippets/
cd myna
cd mypkg
cd mypy-2.3.1/
cd n
cd nab_index-0.0.17/
cd nab_markersets-0.0.17/
cd nab_resolver-0.0.17/
cd nbconvert/
cd nbproject/
cd neo-tree.nvim/
cd neo_vim/
cd neo_vim/0
cd neodev.nvim/
cd neopyter/
cd neotest-python/
cd neotest_python/
cd neovim
cd neovim/
cd net
cd netrw/
cd new
cd newrepo/
cd nh3
cd nh3-0.3.7/
cd nightfox.nvim/
cd nltk_data/
cd no-cost-ai/
cd no_extension/
cd node-gyp/
cd node_modules/
cd none-ls.nvim/
cd notebook
cd npm
cd numba-0.67.0.dist-info/
cd numba-0.67.0/
cd numpy
cd numpy-2.5.2.dist-info/
cd numpy_bfa9312f06974e968ed74f4faa65a2a2/
cd numpy_e7995367f58f466db62ee4bacdf38a4c/
cd numpy_fe89426d40c144e8b501b3cb11e1e871/
cd nutrient_sdk
cd nvchad
cd nvim
cd nvim-alexis/
cd nvim-asBRK
cd nvim-astrovim
cd nvim-astrovim/
cd nvim-basic/
cd nvim-cmp
cd nvim-config/
cd nvim-kickstart-python/
cd nvim-kickstart/
cd nvim-lazyman
cd nvim-lazyman/
cd nvim-lazyvim/
cd nvim-lspconfig
cd nvim-nio
cd nvim-nvchad/
cd nvim-plugin-template/
cd nvim-pysys/
cd nvim-python-config/
cd nvim-tree
cd nvim-tree.lua
cd nvim-tree.lua/
cd nvim-treesitter
cd nvim-treesitter-textobjects/
cd nvim-treesitter/
cd nvim-ufo
cd nvim.bak
cd nvim/
cd nvim/lua
cd nvim_config/
cd nvim_old/
cd nvim_perplex/
cd nvim_trend/
cd o
cd octo.nvim/
cd octohub.nvim/
cd octohub/
cd old
cd old_scripts/
cd openai.nvim/
cd openai/
cd opencode.nvim/
cd opencv
cd opencv/
cd opencvpython/
cd opt
cd options/
cd other
cd out
cd output/
cd overflow/
cd overlay/lib/python3.12/site-packages/
cd overseer.nvim/
cd p
cd p 
cd pack/
cd pack/packer/
cd pack/plugins/start/
cd packages/
cd packages/pyright/
cd pak
cd pandas
cd parser
cd pathlib/
cd pcurl
cd pdf
cd pdfminer
cd pdfminer.six/
cd persian/
cd phuff/
cd pio
cd pip
cd pip-20.3.4.dist-info/
cd pip-25.0.1.dist-info/
cd pip-26.1.2.dist-info/
cd pip-26.2.1.dist-info/
cd pip-build-env-gix4wm40/
cd pip-install-13euqep6/
cd pip-install-1xx8me5c/
cd pip-install-4ugjshuw/
cd pip-install-6m47fhsy/
cd pip-install-9mwml_2z/
cd pip-install-bk0749sw/
cd pip-install-cnyfersw/
cd pip-install-d0bk3_3p/
cd pip-install-dk9r63hb/
cd pip-install-ezrun8m2/
cd pip-install-g8k2cbz4/
cd pip-install-h60o45ht/
cd pip-install-h9blsn7y/
cd pip-install-i174r2oz/
cd pip-install-ibhmims_/
cd pip-install-njobr4p4/
cd pip-install-sf3t379m/
cd pip-install-t82vjc_i/
cd pip-install-vi9jdss6/
cd pip-install-vnyygfej/
cd pip-install-vtm4n_pd/
cd pip-install-xps5e4d3/
cd pip-install-y5vtr6f8/
cd pip-tools-main/
cd pip262
cd pipcl
cd pipdeptree/
cd pipdeptree_221136daffe34340901c700a4f6248e3/
cd pipdown
cd pipdown-1.4.7.dist-info/
cd pipdown/
cd piptar
cd piptools_docs/
cd pkg-name/
cd pkg_resources/
cd pkgconfig/
cd pkgd
cd pkgs
cd pkgs/
cd pkhs
cd platform/
cd platformdirs/
cd plug
cd plugin
cd plugin/
cd plugins
cd plugins/
cd polars-2.0.0rc1/
cd pre_commit/
cd prettier
cd prettier/
cd prettierpy
cd pro
cd projects/
cd projects/lua
cd projects/neo_vim/
cd projects/py
cd projects/rust/
cd projects/rust/fastwalk
cd protobuf/
cd prunetables/
cd punkt
cd puter/
cd putup
cd pwords
cd pwords/
cd pwords/fa
cd py
cd py-mini-racer_6712668080b04089a2363f7d0a9a452a/
cd py2.7/
cd py_mini_racer
cd py_mini_racer/
cd py_spy-0.4.2/
cd pyb
cd pychm_aa0236b9418040bc9300f9460b560b6f/
cd pychm_c9795e21b032421b888a775cbe2b7cb6/
cd pycmd-fork/
cd pycountry
cd pycrypto/
cd pydirb
cd pydoc_data/
cd pyget
cd pyhunspell/
cd pykociemba/
cd pylibmspack-0.4.0/
cd pylyzer-0.1.0b0/
cd pylzma-0.6.1/
cd pymagic/
cd pymupdf
cd pymupdf-1.26.5/
cd pymupdf-1.28.0.dist-info/
cd pymupdf-mimic/
cd pymupdf/
cd pymupdf1.16.14/
cd pynacl-1.6.2/
cd pyncdu
cd pyncdu_f40a0298c79246f890008cc27dff2ea1/
cd pynvim
cd pypackage/
cd pypdfium2
cd pypdfium2-4.18.0/
cd pypdfium2-5.13.0/
cd pypdfium2/
cd pypdfium2_d65523bc67334df1b1af0e65faf40e4c/
cd pypi.org/
cd pypi_bot/
cd pyppmd
cd pyppmd-1.3.1/
cd pyprettier/
cd pyproject2setuppy
cd pyproject2setuppy-22.dist-info/
cd pyproject2setuppy/
cd pyproject_init
cd pyproject_init-1.1.0.dist-info/
cd pyproject_initializr-1.0.1.dist-info/
cd pyright-27260-jcicliS7VMig/
cd pyrival/
cd pyspell
cd pyspell/
cd pysrt
cd pysrt-1.1.2.dist-info/
cd pysrt-1.1.2/
cd pysrt/
cd pythom
cd python
cd python-apm/
cd python-arabic-reshaper-2.1.0/
cd python-debian/
cd python-gui/
cd python-package-example/
cd python/
cd python3.12
cd python3.12/
cd python3.x
cd python_template_project-0.2.4/
cd pythonshellcode/
cd pythran
cd pywavelets-1.9.0/
cd pywavelets/
cd pywt
cd pyzmq-27.1.0/
cd pyzmq-27.2.0/
cd qt6
cd qt6qt5compat/
cd qt6qtbase/
cd qt6qtdeclarative/
cd qt6qtlanguageserver
cd qt6qtlanguageserver_1/
cd qt6shadertools/
cd queries/
cd query
cd quotes/
cd rainbow-delimiters.nvim/
cd rb
cd rbenv
cd rbenv/
cd re
cd refac/
cd refactor_utils
cd refactor_utils/
cd registries/
cd registry/
cd release/
cd repod
cd repos
cd repos/
cd repos/cramjam/
cd repos/downloads/
cd repos/downloads/grpc/
cd repos/trend/
cd requirements/
cd resources/
cd reuse
cd reverse/
cd rich/
cd rmc/
cd rmlint/
cd robofab
cd robofab/
cd rpds
cd rplugin/
cd ruby-build/
cd ruff
cd ruff-aarch64-unknown-linux-gnu/
cd runtime/
cd rust
cd rust-by-example/
cd rust/
cd rustlib/
cd rustwalk
cd rustwalk/
cd s
cd safetensors-0.8.0/
cd samba-2.2.3a/
cd samsung_hanja_json/
cd scipy
cd scipy-1.16.3.dist-info/
cd scipy/
cd scrapegraph-ai/
cd screenshots_1/
cd scripts
cd scripts/
cd scripys
cd sebsite.pw/
cd seed
cd select/
cd semantic_version
cd series
cd series/
cd setuptools
cd setuptools-84.0.0/
cd sh_1/
cd share
cd share/
cd share/nvim
cd shell/
cd shfmt
cd shfmt/
cd site
cd site-packages/
cd site/
cd skimage/
cd snacks.nvim/
cd snipmate/
cd snippets/
cd source/
cd source/extending/
cd spell
cd spell/
cd split_movies/
cd spyll
cd spylls
cd spylls/
cd sql
cd sqlite/
cd src
cd src/arutils/
cd src/chat_client/
cd src/faprint
cd src/faprint1
cd src/fh8/
cd src/index.crates.io-1949cf8c6b5b557f/
cd src/json_prettifier
cd src/mhtml-to-html/
cd src/mhtml_to_html
cd src/mypkg/
cd src/prettier/
cd src/pypdfium2/
cd src/pyprettier/
cd src/python/
cd src/sdk
cd src/summarize/
cd src/svgo/
cd src/xdelta
cd src/zoxide/
cd srcipts
cd srv
cd start/
cd state
cd state/
cd statusline/
cd storage/shared
cd string
cd stylesheets/
cd subs/
cd subtitle-2.3/
cd subtitle/
cd summa/
cd summarize
cd summarize/
cd supprt/
cd surya
cd surya_ocr-0.22.1.dist-info/
cd svg
cd svgo
cd svh
cd swap
cd t01
cd t3
cd tabufline/
cd takeout/
cd tar
cd target
cd target/
cd target/wheels/
cd telegram/
cd telescope-fzf-native.nvim/
cd telescope.nvim
cd temp.linux-armv8l-cpython-312/
cd templates/
cd termux-packages/
cd termux_packages/
cd termuxgui/
cd tessdata
cd test
cd test/
cd test2
cd test2/
cd tests
cd tests/
cd textaul_nvim/
cd textual_nvim/
cd tgz
cd themes
cd third_party/
cd thirdparty/
cd thonny/
cd thonny_textual/
cd thorn.nvim/
cd tide.nvim/
cd tide/
cd tik/
cd tiktoken-0.12.0.dist-info/
cd tiktoken-0.14.0/
cd tinfoil/
cd tmp
cd tmph4d9afo4/
cd tmppaduaequ/
cd todo-comments.nvim/
cd token8zers/
cd tokenizers-0.23.2/
cd tokenizers/
cd tokyonight.nvim/
cd tomllib
cd toold
cd tools
cd tools/
cd trans/
cd translate01.srt/
cd transport/
cd tree-sitter-0.26.13/
cd tree-sitter-c/
cd tree-sitter-css/
cd tree-sitter-markdown
cd tree-sitter-markdown-inline/
cd tree-sitter-markdown_inline/
cd tree-sitter-python/
cd tree-sitter-rust/
cd tree-sitter/
cd tree_sitter/
cd tree_sitter_css
cd tree_sitter_css-0.25.0/
cd tree_sitter_language_pack-1.16.1/
cd treesitter-config/
cd treesitter-vs-semshi/
cd treesitter/
cd trend
cd trend/
cd trouble.nvim/
cd ts-comments.nvim/
cd tsp
cd ttf
cd ttt
cd ttt/
cd twilight.nvim/
cd txt
cd typer
cd types
cd typing
cd typings
cd typings/
cd udr
cd ui
cd ujson-5.13.0/
cd ultisnips
cd ultisnips/
cd uncomment
cd uncomment-3.6.0/
cd undo
cd undo/
cd unforgivenii147/
cd unforgivenii147/new
cd unit/
cd unix_ar/
cd useful_tools/
cd usr
cd usr/
cd usr/var/lib
cd util
cd util/
cd utils
cd utils.nvim/
cd uv
cd v1
cd v2
cd v2/
cd v3/
cd var
cd var/lib/dpkg/info
cd vendor/
cd venv
cd venv-selector.nvim
cd venv/lib/python3.12/site-packages/
cd vim
cd vim-fugitive/
cd vim-matchup/
cd vim-plugin/
cd vim-repeat/
cd vim-sandwich/
cd vim-toml/
cd vimplugins/
cd vint
cd virtualenv
cd virtualenv/seed
cd volt
cd vscode.nvim/
cd vscode/
cd w
cd walkdir-0.4.1/
cd weasyprint/
cd wheels
cd wheels/
cd wheels/embed
cd which-key.nvim/
cd whisper/
cd whitespace.nvim/
cd whl
cd whois
cd woff
cd woff2
cd woff2/
cd words
cd words/
cd workbook/
cd world/
cd www.programmingfonts.org/
cd www.subtitlecat.com/
cd x11-packages/
cd xcb-proto-1.17.0/
cd xcb-proto/
cd xcbgen/
cd xdelta/
cd xdg/config/nvim/
cd xxhash-4.0.1.dist-info/
cd xxhash-4.0.1/
cd yanky.nvim/
cd youtube\ and\ youtube\ music/
cd yt
cd zai
cd zai/
cd zi0
cd zinnia-theme-html5/
cd zip
cd zlib
cd zoxide/
cd zst
cd ~/.cargo/
cd ~/.config
cd ~/.config/nvim/lua/config
cd ~/.config/nvim/lua/plugins/
cd ~/.npm-global/lib/node_modules/
cd ~/projects/neo_vim/
cd ~/projects/py
cd ~/projects/py/prettier
cd..
cdb-
cdmod -x pyproject.toml 
cdvswap
cext
cf
cf .cache
cf 7z
cf astrotheme/
cf bin
cf examples/
cf flakehell/
cf harrisoncramer.me/
cf lua/config/
cf neo_vim/
cf nvim-astrovim/
cf pymupdf-1.26.5/
cf pywavelets-1.9.0/
cf readme/
cf reverse/
cf vim-nightfly-guicolors/
cf vim-resizr
cf xxhash
cf yanky.nvim
cf2mp
cf2mp --apply
cf2mp --help
cf2mp3
cf2mp3 .
cf2mp4
cf2mp4 .
cforyou
check4update
check4update.py
check_path_conflicts
check_path_dups
check_rmc
check_system_bin
check_system_missing_files
checkforupdate
checkspell -d ~/.personal_dict yap.py
checkspell quotes.json
chk_imports
chm2pdf PyMuPDF.chm
chmod +x *
chmod -x *
chmod -x .flake8
chmod -x .gitignore
chmod -x .pylintrc
chmod -x README.md
chmod -x pyproject.toml 
chmod 0666 control
chmod 0755 DEBIAN/
chmod a+rwx *
chmodi
chunk: list[str], exclude_set: frozenset[str], mode: str
chunk_size = max(1000, len(lines1) // num_workers)
chunks = [lines1[i : i + chunk_size] for i in range(0, len(lines1), chunk_size)]
chx *
chx *.py
chx *.sh
chx Jamfile
chx Jamfile-engine
chx kite-http
chx mame
clang ext.c -o ext
clang++ -O3
clang++ -O3 cleanup_here.cpp -o klin
clang++ -O3 ddd2.cpp -o ddd
clang++ example.cxx -o example
clean_bash
clean_bash build.sh
clean_css
clean_html
clean_html providers.html
clean_log *.log
clean_lua
clean_lua dap.lua 
clean_lua lsp.lua
clean_lua options.lua
clean_lua tokyo.lua
clean_md
clean_py --dry-run
clean_record
clean_version all
cleanbash
cleanccpp
cleanccpp -i
cleanccpp.py -i strxor.c 
cleancss *.css -o a5.css
cleancss *.css -o github_flavour_markdown.css
cleancss *.css -o merged0.css
cleancss2
cleancss2 aokgggefcs.css 
cleancss2 bootstrap4.4.1.min.css 
cleancss2 custom.css 
cleancss2 epizsgpbks.css 
cleaner
cleaner tue18aug0111.log
cleanjs
cleanup
cleanup_darwin
cleanvim
cls
cmake ..
cmake build .
cmk
cmkk
cnn
code_snip_extractor ans.md
comment keymaps.lua  70 83
commentout cutoff2024.sh 21 84
commentout fix_escape.py 88 108
commentout init.lua 379 390
commentout keymaps.lua  70 83
commentout keymaps.lua 2 21
commentout keymaps.lua 85 105
common_count = len(set1 & set2)
compile_c_cpp_files
conmaker
cookiecutter cc-minimal/
cookiecutter cc-pypackage/
copy_pkg_files pip
copy_system_pkg_files abseil-cpp
copy_system_pkg_files libprotobuf
copy_system_pkg_files protobuf
count
count --help
count --usage
count 123
count autocmds.lua
coverage --help
coverage annotate fileutils.py
coverage fileutils.py
coverage help
coverage json .
coverage2json
coveralls
cp *.srt ./srt/
cp *.whl ~/repos/pip/
cp -r ~/bin .
cp ../.flake8 .
cp ../.gitignore .
cp ../build.sh .
cp .lazy.lua neotree.lua
cp README.md ibl.lua
cp README.md octohub.lua
cp abbreviations.json a.json
cp bin/py/f2c.py .
cp commands.sh ./output/
cp en_US.dic hunspell.txt
cp example.lua treesitter.lua
cp extract_abbr.py ex_abbr.py
cp fa-IR.dic fa.txt
cp index.pyi standalone.pyi
cp jsregexp/*.so .
cp jsregexp/jsregexp.so luasnip-jsregexp.so
cp localthemes.lua vim-fugitive.lua
cp options.lua old_options.spec
cp out.lua out2.lua
cp package.json p.json
cp pip-26.2.1-py3-none-any.whl ~
cp pngq.py jpo.py
cp python3.12 python
cp replacer.py strip_html_tags.py
cp six.py ./pip/_vendor/
cp template q19
cp template q20
cp termimg.md termimg.py
cp tt cleanhtml.q
cp tt q66
cp tt rmc.q
cp woff2woff2.py otf2woff2.py
cp x5.py a.py
cp x5.py b.py
cp ~/.bash_history .
cp ~/.bashrc .
cp ~/.gitignore .
cp ~/bin/.gitignore .
cp ~/bin/furls.py .
cp ~/bin/x5.py .
cp ~/bin/zstder.py .
cp ~/t.py .
cp ~/tmp/blink.tar.xz .
cpell dictionaries
cprint(
cprint(f"  - {line}", "green")
cprint(f"  - {line}", "yellow")
cprint(f"only in {path1.name}:", "cyan")
cprint(f"only in {path2.name}:", "cyan")
crawl_movie_site
crawler
create_stub
create_stub zsr.py
create_stub zstder
create_stub zstder.py
create_symlink
create_symlink.py
create_symlink.py 
crontab -e
crun
cs
cs py_mini_racer/
cspell *.py
cspell --help
cspell bin.mjs
cspell check t.py
cspell config
cspell dictionaries
cspell init
cspell quotes.json
cspell t.py
cstext
cstrmc
csubdirxz
csubdirxz.py
csubzstd
csubzstd.py
curl -sSL https://install.python-poetry.org | python -
cx
cx -
cx .con
cx .config
cx .config/
cx 0
cx 37k-60k/
cx CPython-312-33/
cx bin
cx binding_rust/
cx boringssl-with-bazel/
cx cmaprsrc/
cx coffee/
cx cryptography-47.0.0/
cx csz
cx cv
cx demo
cx doc
cx experiments/
cx faprint/
cx fonttools/
cx ftplugin/
cx html
cx huffman_compression/
cx hunspell-1.2.15/
cx hunspell/
cx js
cx kite/
cx lazy
cx lib
cx llhttp-release-v8.1.0/
cx lua
cx lub
cx neo_vim/
cx nvim-config/
cx nvim-lazy
cx nvim-python-config/
cx nvim_lsp
cx opencv4/
cx out
cx output/
cx pack
cx pip-install-212phi5k/
cx pipcl_test/
cx plugins/
cx ppdeep/
cx projects
cx pwords/
cx py_1/
cx pyarchive/
cx pyproject2setuppy
cx python
cx python_template_project-0.2.4/
cx pywavelets-1.9.0.dist-info/
cx queries/python/
cx registry/
cx reverse/copilot/
cx rmlint/
cx ruby-download/
cx scripts/
cx series/
cx target/
cx thonny
cx tool
cx unit/
cx util
cx utils
cx v2
cx ~/projects/rust/walkdir-0.4.1/
cytonizer
d
d -
d,p
dcim
dd
ddc
ddd
dddd
dddg
ddf
dds
ddup_bash_functions
de
deactivate
deborphan.py
deborphan2.py
deepack
deepbinlist
def count_lines(path: Path) -> int:
def filter_diff_chunk(
def get_mime_type(file_path: str) -> str:
def is_image(url: str) -> bool:
def is_remote(url: str) -> bool:
def main():
def process_css_content(
def process_css_file(file_path: Path) -> dict:
def process_file(path: Path) -> dict:
def process_html_file(file_path: Path) -> dict:
def read_file_task(path: Path, use_mmap: bool) -> tuple[Path, list[str]]:
def read_local(path: Path) -> bytes | None:
def report_diff_lines(path1: Path, path2: Path, num_workers: int = 2) -> None:
delafter enfa_failed.json ':'
delafter fa.txt '/'
delafter hunspell.txt '/'
delafter plugins.md ':'
delafter reqz.txt '!'
delafter reqz.txt '('
delafter reqz.txt ';'
delafter reqz.txt '<'
delafter reqz.txt '=='
delafter reqz.txt '>'
delafter reqz.txt '['
delafter reqz.txt '~'
delafter ruff_rulles ' | '
delafter serialized_dictionary.json ':'
delafter upgrade.txt ':'
delafter.py a.json ':'
dele,p
delemo
delemp
delemp -s
delemp .pylintrc
delemp 1.md 
delemp detect_pkgresources.py
delemp healthcheck.txt
delemp merge_pkg.py
delempco
detect_orphan_files
detect_orphan_files.py
detect_pkgresources
detect_pkgresources -a
detect_pkgresources .
detect_pkgresources.py
detect_pkgresources.py deepbinlist.py
detect_pkgresources.py pysanity-check.py
detect_unused -c
dff
dgd3dd9l
dh
dh2
dh_reverse
dh_usage
diff --git a/rplugin/python/floobits/__init__.py b/rplugin/python/floobits/__init__.py\nindex d9ef9e8..cf57cb2 100644\n--- a/rplugin/python/floobits/__init__.py\n+++ b/rplugin/python/floobits/__init__.py\n@@ -45,7 +45,7 @@ reactor = reactor.reactor\n \n # Protocol version\n G.__VERSION__ = '0.11'\n-G.__PLUGIN_VERSION__ = '3.4.3'\n+G.__PLUGIN_VERSION__ = '3.4.4'\n \n G.LOG_TO_CONSOLE = False\n G.CHAT_VIEW = True\n
diff ascan.py ascan2.py
diff failed.txt failed_fa.txt
dipf
dir2whl
dir_mover opt lazy
dirb https://serialblog1.top/series
dirz
distinfo
distinfo2
dj
dj -r
djb-r
dll .bash_history 1 74
dll .bash_history 387 1419
dll 002.mhtml 766
dll 1.txt 1 277
dll 2.txt 1 50
dll 3.txt 1 77
dll 4.txt 1 46
dll README.md 34
dll a 1 1365
dll a 1 51
dll ab 1 460
dll afk.py 566
dll all 1 1264
dll all1 2 186
dll ans.md 9 39
dll august/fixext_19_190312.py  5 1389
dll b 1 135
dll bash2py.py 1 1815
dll cf2mp4.py 179 359
dll check_dups.py 14 91
dll delempco 30 237
dll dic_en.json 1 2550
dll dup_detector.py 159 181
dll example.lua 50 70
dll flakeheaven-source.txt 119 293
dll flakeheaven-source.txt 36 58
dll flakeheaven-source.txt 39 88
dll flakeheaven-source.txt 54 127
dll flakeheaven-source.txt 8 98
dll furls.py 3
dll ibl.lua 75
dll ibl.spec 73
dll imports.py 14 562
dll indent-blankline.lua 30 64
dll lib.rs 185
dll markdown.css 1 92
dll misspelled.nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
dll misspelled.txt 374
dll new2old.py 611
dll octohub.lua 1 46
dll octohub.lua 45
dll octohub.lua 52
dll options.lua 6 87
dll options.lua 73 130
dll os2p.py 750
dll p.json 44
dll pip.txt 5530 5927
dll piprm.py 11 67
dll pkg_resources_reporter_autofixer.py 437
dll py.txt 1 130
dll py.txt 1 205
dll py.txt 1 24
dll py.txt 1 88
dll pyproj.py 84 235
dll requirements.txt 1 10
dll requirements.txt 1 30
dll rprompt.py 13 86
dll rubik.lua 1 25
dll rubik.lua 7
dll sd 1 138
dll setup.py 19 88
dll strip_installed_pkgs.py 7 498
dll urls.txt 8
dll usage.md 1 105
dll utils.py 18 75
dll validate_binary_extensions 140 169
dll write_a_python_script_to_detect_pkg_reso.txt 1 411
dmp
dmp 
dnp
do.py
doc
docer cchardet.md 
docer dutree.md 
docer filecheck.1.md
docer gevent_docs.tar.xz 
docer installer_docs.tar.xz 
docer jiter.md 
docer jupyterlab.tar.xz
docer nh3.md 
docer nh3_docs.md 
docer optipng.html
docer piptools_docs.tar.xz
docer pyncdu.md 
docer ruff_rules.md 
docer setuptools_docs.tar.xz 
docer topics.md
dov
dpkg --configure -a
dpkg -i *.deb
dpkg -i abseil-cpp_20250814.1_arm.deb
dpkg -i libprotobuf_2%3a33.1-1_arm.deb
dpkg -i p.deb
dpkg -i pip.deb
dpkg -i rust_1.98.1_arm.deb 
dpkg-deb -b deb pip.deb
drr
ds mupdf/
du
dufpy
dufx
dup_detector
dup_detector.py
dupf
dupf'
dupfx
dupgx
dutree
dutree .
echo $CFLAGS
echo $LDFLAGS
echo $LIBRARY_PATH
echo $PATH
echo $PKGCONFIG_PATH
echo $TERM
eelemp
else:
env
erap -t
erap -t .
erap -t a*.py
erap -t pydiff.py
erap a*.py
erap erap.py
erap yap.py
esbuild install.js
etap -t
ex_comments
ex_srt Taboo.S01E06.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
ex_srt2 Taboo.S01E06.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
excss
excst
executor.submit(
exit
exjs
exlinks https://www.nerdfonts.com/font-downloads
export CFLAGS="-Wno-implicit-function-declaration"
export GLM5_TOKEN="e23b8dfe585e400fa09dc54d0046fc35.mgkFaw9bmlF7oArh"
export GLM5_TOKEN="sk-glm5-4653ed77d1c021a4f4d0e5c784b2e10241d9b48e1a392ef7"
export GLM_TOKEN="e23b8dfe585e400fa09dc54d0046fc35.mgkFaw9bmlF7oArh"
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
export PATH="/data/data/com.termux/files/usr/bin"
export PATH=~/.pyenv/bin:$PATH
export PYTHONOPTIMIZE=2
export Z_TOKEN=e23b8dfe585e400fa09dc54d0046fc35.mgkFaw9bmlF7oArh
exsrt Taboo.S01E03.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
exsrt Taboo.S01E06.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
exsrt2
exsrt2 Taboo.S01E03.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
exsrt2 Taboo.S01E06.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv
extcst
extract_base64_assets
extract_embedded_elements
extract_file_urls
extract_py_code
extz
extz -n
exurls https://www.nerdfonts.com/font-downloads
f
f"common lines: {common_count}\nonly in {path1.name}: {len(only_in_first)}\nonly in {path2.name}: {len(only_in_second)}",
f1 = Path(sys.argv[1])
f2 = Path(sys.argv[2])
f2c 100
f2h 100
f2l ruff_rulles 
f2l txt_ext
f45 --help
f45 lsp.log
f45 luasnip.log
f45 mason.log
f45 neotest.log
f45 nio.log
f45 null-ls.log
faprint 'دانه'
fc-cache -fv
fc1
fchin
fco
fd -e body -x cp -v {} .
fd -e deb -x dpkg -i {}
fd -e html
fd -e html --exclude lazy
fd -e mhtml -x mhtml-to-html
fd -e sh -tl
fd -e spec
fd -e svg
fd -td __pycache__ -x rm -rvf
fd -td bin
fd -td body
fd -td lua_ls
fd -td tests
fd -tf -x translate -i {} --source zh-CN --target en
fd -tl
fd -tl 
fd -tl -x rm
fd -x file
fd -x gunzip
fd -x mk_standalone
fd -x mkc
fd -x sortbylen
fd -x sqlite2json
fd -x sqlite2json2 
fd -x sqlitetojson
fd -x strings
fd -x strip
fd -x striper
fd -x to_jpg
fd -x upkl
fd -x w3m -dump
fd -x xz -d
fd .git
fd .gitattribute
fd .gitattribute -x rm
fd .gitignore
fd .gitignore -x cat {} >> .gitignore
fd .gitignore -x rm
fd .gitmodules
fd 2
fd Italic
fd LIC
fd RECORD | rg summarize
fd \:\:
fd ___
fd ___ -x rm
fd _folded_folded -x rm
fd _interpret
fd aspel
fd aspell
fd async
fd auto
fd avif
fd background
fd bin
fd clean
fd compile_previse
fd contex
fd cooki
fd copilot
fd cpwhl
fd crypto
fd css
fd dap
fd darwin
fd darwin -x rm -rvf
fd deptree
fd dir_mov
fd dot
fd du
fd entry
fd fa
fd file
fd fontello
fd gensim
fd gevent
fd gh
fd git
fd gitignore
fd gitignore -x rm
fd gitmodule
fd gitmodules
fd gzip
fd http
fd hunspell.hxx
fd javac
fd kociemba
fd kociemba -x rm
fd libhttp
fd libllhttp
fd line
fd link
fd local
fd lsp
fd lua
fd lua_ls
fd luaxlib.h
fd make
fd mat
fd mater
fd melam
fd melan
fd mod
fd modas
fd move_dirs
fd movedirs
fd neo
fd neo-tree
fd neo_vim
fd neovim
fd newrepo
fd nul
fd null
fd nvim
fd nvim-tree.lua
fd openoffice
fd option
fd options
fd pdf
fd pdm
fd perf
fd perpage
fd pickl
fd pjg_resourc
fd pkg_resourc
fd pool
fd postinst
fd prometh
fd proto
fd pykyzer
fd pylyzer
fd pyproject.toml
fd queries
fd re2
fd repl
fd requirements.txt
fd requirements.txt -x rm
fd ruby
fd rubyenv
fd ruff
fd ruff.toml
fd rule
fd runflar
fd runflare
fd sboms
fd scanbuild
fd search
fd setup
fd setup.py
fd sono
fd spli_lua
fd split_lua
fd sqlite
fd stylua
fd stylua.toml
fd stylua.toml -x cat
fd stylua.toml -x cat {}>> .stylua.toml
fd target
fd test
fd tests
fd theme
fd tree
fd treesitter
fd typer
fd ufo
fd vim
fd walk
fd which
fd win32
fd win32 -x rm -rvf
fd windows
fd x5
fd z9x
fd zipbr
fd zox
fdd
fdd '.git -execdir git pull \;
fdd '.git'
fdd '.git' -execdir git checkout master \;
fdd '.git' -execdir git pull \;
fdd '.git' -execdir git reset --hard \;
fdd '.git' -execdir git restore . \;
fdd '.git' -execdir rm -rvf {} \;
fdd '.git*'
fdd '.github'
fdd '.github' -execdir rm -rf {} \;
fdd '.github' -execdir rm -rfv {}  \;
fdd '.github' -execdir rm -rvf {} \;
fdd '.github' -execdir rm -v {}  \;
fdd usr -execdir mv {} . \;
fde 0
fde 1
fde 720
fde 7z -x 7z x {}
fde PNG
fde SVG
fde add
fde aria2
fde bak
fde bat
fde body
fde body -x cp -v {} ./body/
fde br
fde c
fde cpp
fde db
fde dll
fde exe
fde exe -x rm
fde gz
fde gz -x gunzip
fde htm -x mk_stand
fde htm -x mk_standalone
fde html
fde html -x bbtml
fde html -x bhtml
fde html -x rm
fde hxx
fde ipynb -x jupyter-trust
fde java -x javac
fde json
fde lig
fde local
fde log
fde log -x cleaner
fde log -x f45
fde log.txt
fde lua
fde lua --batch-size=33 -X stylua {}
fde md
fde mhtml
fde minix
fde mkv
fde no_ext
fde o
fde o -x rm
fde oprig
fde orig
fde otf
fde otf -x mv {} ..
fde pdf
fde pj.
fde png
fde png -x pycatimg
fde png -x rm
fde pth
fde py
fde py --batch-size=11 -X stubgen {}
fde py --batch-size=111 -X zstd --rm -13 {}
fde py --batch-size=6 -X stubgen --verbose {}
fde py --batch-size=6 -X stubgen {}
fde py -x mv -v {} ~/projects/
fde py -x pyrefly infer {}
fde py2
fde pyc
fde pyc -x rm
fde pyc -x rm -rvf
fde pyc -x rm -v
fde pyi
fde pyx
fde rs
fde rs -x rustc
fde save
fde scm
fde sh
fde sh -x rm
fde so
fde so --batch-size=11 -X chmod +x {}
fde so --batch-size=111 -X zstd --rm -13 {}
fde so -x chmod +x
fde so -x chmod +x {}
fde so -x chmod ar+x {}
fde so -x rm
fde so -x strip
fde spe
fde spec
fde spec -x rm
fde spl
fde srt
fde srt -x rm
fde svg
fde tar
fde tar.xz
fde tar.zst
fde tom
fde toml
fde toml -x taplo format
fde ts
fde ttf
fde ttf -x mv {} ..
fde txt
fde txt -x sortbylen
fde txy
fde vim
fde whl
fde whl -x cp -v {} .
fde whl -x pip install
fde woff
fde xz
fde zip
fde zst
fde zst --batch-size=112 -X zstd --rm -d {}
fde zst -x bash -c "tar -xvf {} && rm -v {}"
fde zstd
fds py
fe py
felemp
felo 'how many episodes black sails s4 had?'
felo --helo
felo --help
felo config get language
felo config list
felo config set lang english
felo mindmap 'top cli toold for python code analysis'
felo search '
felo search 'can we detect and extract python regexes using tree-sitter-regex python pkg'
felo search 'how many episodes black sails s4 had?'
felo search 'how to get full pypi pkgs list ranked by top downloads, answer in english'
felo search 'how to install R language in termux'
felo search 'how to safely merge current commit (that is a detached head) to main branch and switch to main'
felo search 'how to safely merge current commit (that is a detached head) to main branch and switch to main,answer in english'
felo search 'how to set language to english for felo-ai cli tool'
felo search 'i downloaded hunspell .dic .aff for persian lang manualky,where should i put them in linux ditree,respond in english'
felo search 'top ai chatbots websites using glm5.2, answer in english'
felo search 'top cli tools for python code analysis and ranking, answer in english'
felo search 'top cli tools for python code analysis'
felo search 'top uk ai websites, answer in english'
felo search 'translate following to english ダウンロード
felo superagent 'nvim config for python programming using lazy.vim'
felo web-fetch -u https://felo.ai/mindmap/24fbbe6a-56dd-48a3-abb8-f524c75585f1
felo web-fetch ttps://felo.ai/mindmap/24fbbe6a-56dd-48a3-abb8-f524c75585f1
feloai 'how to configure nvim to consider .spec files as lua files'
feloai 'how to configure nvim to run python code and see output'
feloai 'implement following node based pkg in python, {"name": "marked", "description": "A markdown parser built for speed", "author": "Christopher Jeffrey", "version": "18.0.9", "type": "module", "main": "./lib/marked.esm.js", "module": "./lib/marked.esm.js", "browser": "./lib/marked.umd.js", "types": "./lib/marked.d.ts", "bin": {"marked": "bin/marked.js"}, "man": "./man/marked.1", "files": ["bin/", "lib/", "man/"], "exports": {".": {"types": "./lib/marked.d.ts", "default": "./lib/marked.esm.js"}, "./bin/marked": "./bin/marked.js", "./package.json": "./package.json"}, "publishConfig": {"provenance": true}, "repository": {"type": "git", "url": "git+https://github.com/markedjs/marked.git"}, "homepage": "https://marked.js.org", "bugs": {"url": "https://github.com/markedjs/marked/issues"}, "license": "MIT", "keywords": ["markdown", "markup", "html"], "tags": ["markdown", "markup", "html"], "devDependencies": {"@arethetypeswrong/cli": "^0.18.5", "@markedjs/eslint-config": "^1.0.14", "@markedjs/testutils": "18.0.0-1", "@semantic-release/commit-analyzer": "^13.0.1", "@semantic-release/git": "^11.0.1", "@semantic-release/github": "^12.0.9", "@semantic-release/npm": "^13.1.5", "@semantic-release/release-notes-generator": "^14.1.1", "cheerio": "1.2.0", "commonmark": "0.31.2", "cross-env": "^10.1.0", "dts-bundle-generator": "^9.5.1", "esbuild": "^0.28.1", "esbuild-plugin-umd-wrapper": "^3.0.0", "eslint": "^10.8.0", "highlight.js": "^11.11.1", "markdown-it": "14.3.0", "marked-highlight": "^2.2.4", "marked-man": "^2.1.1", "recheck": "^4.5.0", "rimraf": "^6.1.3", "semantic-release": "^25.0.8", "titleize": "^4.0.0", "tslib": "^2.8.1", "typescript": "6.0.3"}, "scripts": {"bench": "npm run build && node test/bench.js", "build": "npm run build:esbuild && npm run build:types && npm run build:man", "build:docs": "npm run build && node docs/build.js", "build:esbuild": "node esbuild.config.js", "build:man": "marked-man man/marked.1.md > man/marked.1", "build:reset": "rimraf ./lib ./public", "build:types": "tsc && dts-bundle-generator --export-referenced-types --project tsconfig.json -o lib/marked.d.ts src/marked.ts", "lint": "eslint --fix", "rules": "node test/rules.js", "test": "npm run build:reset && npm run build:docs && npm run test:specs && npm run test:unit && npm run test:umd && npm run test:cjs && npm run test:types && npm run test:lint", "test:cjs": "node test/cjs-test.cjs", "test:lint": "eslint", "test:only": "npm run build && npm run test:specs:only && npm run test:unit:only", "test:redos": "node test/recheck.ts > vuln.js", "test:specs:only": "node --test --test-only --test-reporter=spec test/run-spec-tests.js", "test:specs": "node --test --test-reporter=spec test/run-spec-tests.js", "test:types": "tsc --project tsconfig-type-test.json && attw -P --entrypoints . --profile esm-only", "test:umd": "node test/umd-test.js", "test:unit:only": "node --test --test-only --test-reporter=spec test/unit/*.test.js", "test:unit": "node --test --test-reporter=spec test/unit/*.test.js", "test:update": "node test/update-specs.js"}, "engines": {"node": ">= 20"}}'
feloai 'import argparse
feloai 'which ruff rule causes ths: print(f"[red]error:[/red] {error}") -> print(f"[rex]error:[/red] {'
feloai 'write a python script to convert a bash script containing heredocs python code to python file and save to current dir,input=sys.argv[1],example input: python - <<'PY' from pathlib import Path import ast, collections rows=[] for p in Path('.').glob('*.py'): try: text=p.read_text(encoding='utf-8') tree=ast.parse(text) except Exception: continue funcs=[n for n in ast.walk(tree) if isinstance(n,(ast.FunctionDef,ast.AsyncFunctionDef))] typed=[] missing=[] for n in funcs: args=[*n.args.posonlyargs,*n.args.args,*n.args.kwonlyargs] if n.args.vararg: args.append(n.args.vararg) if n.args.kwarg: args.append(n.args.kwarg) total=len(args)+1 ann=sum(a.annotation is not None for a in args)+(n.returns is not None) typed.append((ann,total)) if ann<total: missing.append(n.name) rows.append((p.name,len(funcs),sum(a for a,b in typed),sum(b for a,b in typed),len(missing))) print('parseable',len(rows),'functions',sum(r[1] for r in rows),'annotations',sum(r[2] for r in rows),'annotation slots',sum(r[3] for r in rows),'partially_or_untyped',sum(r[4] for r in rows)) print('files with funcs but no annotations',sum(r[1]>0 and r[2]==0 for r in rows)) print('top function files') for row in sorted(rows,key=lambda x:x[1],reverse=True)[:30]: print(*row,sep='\t') PY, answer in english'
feloai superagent '#change this code so that if input file  in CODE_EXT(is a programming lang code file)
feloai superagent 'write a python script to clean a given html file that all assets are inlined(contain js,css) remove html,css,js comments save as fname_cleaned.html input=sys.argv[1] -use pathlib'
ff '*.htm
ff '*.html' --exclude '*/lazy/*'
ff '.gitignore' -execdir rm -rvf \;
ff CMakeLists.txt
ff CMakeLists.txt -execdir cmk \;
ff RECORD -execdir grep summarize {} \;
ffe py
fff
ffff
ffgg
fg
fgf
fh8 t.py
file 7e817c84992118bc2ebd0549da594d9dc156d00349dd1efe8c5fab4dcbf2bc00.bin
file PU02.sql 
file PressStart2P.bin
file a
file a01
file a02
file a03
file a04
file a05
file a06
file a07
file a08
file a09
file a10
file a11
file a12
file a13
file a14
file a15
file a16
file a17
file a18
file a19
file a20
file a21
file a22
file a23
file a24
file a25
file a26
file a27
file a28
file a29
file a30
file a31
file a32
file a33
file b
file ba52e604cd42ae0.bin 
file english_postSub.db 
file esbuild.wasm
file ext.bundle
file gitio.rb
file impact.bin
file javac
file kite-http
file lezcfcpetb.js
file libmini_racer.muslc.so
file lxml-6.1.1-cp312-cp312-linux_armv8l.whl
file mame
file metaresources.arsc 
file modules
file monolith-94qhpl
file mozilla 
file multi_language.db 
file node2.conf
file osdb 
file pip-26.2.1-py3-none-any.whl
file py_regex_builder.html
file pylyzer-0.1.0b0-py3-none-manylinux_2_17_armv8l.manylinux2014_armv8l.whl 
file related.xpt 
file rmc.pkg
file snapshot_blob_32.ttf 
file terrace.pak 
file to.env 
file wasm_exec.js
file webster 
file worldmap.astc 
filter_diff_chunk, chunk, frozenset(set2), "only_in_first"
find . -maxdepth 3 -type f | sort
find . -type f -name '*.py' -not -path './.git/*' -print | sort && printf '\n--- Python count ---\n' && find . -type f -name '*.py' -not -path './.git/*' | wc -l && printf '\n--- config ---\n' && find . -maxdepth 2 -type f \( -name 'pyproject.toml' -o -name 'requirements*.txt' -o -name 'setup.py' -o -name 'tox.ini' -o -name '.flake8' -o -name 'README*' \) -print | sort
find . -type f -name \*.7z
find . -type f -name \*.py -execdir translate -i {} --source auto --target en \;
find_and_fix_escape_sequence
find_and_fix_escape_sequence -a
find_big_file_of_repo.sh
find_dup_folders lua ~/.local/share/nvim/lazy
find_dup_func_class_const
find_elf
find_scripts
finded
findid
findnl
findns
findtf
findu8
findul
findup
fissix
fix_escape
fix_escape -a
fix_escape.py
fix_escape2
fix_ext
fix_ext .
fix_ext f.js
fix_pkgres
fix_pkgres -a
fixescape
fixescape -a
fixext
fixext -a
fixext -a meta.sh
fixext2
fixext3
fixext_by_shebang
fixextco
fixextco -a
fixextco -a .
fixextco -y
fixextco -y .
fixshebang
flake8 --benchmark
flake8 --help
flake8 --version
flake8 .
flake8 a*.py
flake8 benchmark
flake8 fileutils.py
flake8 isb1.py
flake8 t.py
flake8 utils.py
flakeheaven missed
flakehell example.py
flaten
fmt_bash
fmt_bash cutoff2024
fname_recommender.py
folderize
folderize_by_sim_names
folderize_by_sim_names --apply
folderize_plugins
foldesiz 3
foldesiz 4
foldext
foldext.py
foldexy
folext
font_converter
font_pre
fontconverter
fontconverter -r
fontpre
fontpreview
for chunk in chunks
for f in  *.zst;do zstd --rm -d $f;done
for f in *.7z;do 7z x $f;done
for f in *.7z;do 7z x$f;done
for f in *.7z;do bash -c "7z x $f && rm $f";done
for f in *.7z;do bash -c "7z x $f && rm -iv $f";done
for f in *.html;do mk_standalone $f;done
for f in *.mhtml;do mhtml-to-html $f;done
for f in *.mhtml;do move_lines $f 1 2 url;done
for f in *.ttf;do woff2_compress $f;done
for f in *.ttf;do woff2_compress$f;done
for f in *.zip;do unzip $f;done
for f in */;do bash -c " cd $f && git reset --hard ";done
for f in */;do bash -c "cd $f && gagc";done
for f in */;do bash -c "cd $f && git config pull.rebase false";done
for f in */;do bash -c "cd $f && git pull";done
for f in */;do bash -c "cd $f && git reset --hard";done
for f in */;do ln -s $f ../../nvim-lazyvim/lazy/$f;done
for f in */;do wheel pack $f;done
for f in *;do ln -s $HOME/.local/share/nvim-lazyvim/lazy/$f  $HOME/.local/share/nvim-nvchad/lazy/$f;done
for f in *;do ln -s $HOME/.local/share/nvim/lazy/$f  $HOME/.local/share/nvim-nvchad/lazy/$f;done
for f in *;do ln -s $f ../../nvim-lazyvim/lazy/$f;done
for f in *;do ln -s $f ../../nvim-nvchad/lazy/$f;done
for f in libQt*;do zstd --rm -13 $f;done
for future in as_completed(futures):
for line in only_in_first:
for line in only_in_second:
free -h
frmc
frmc .gitignore
frmc .pylintrc
frmc Makefile
frmc all
frmc property_contexts
frmc ruff.toml 
from bs4 import BeautifulSoup
from concurrent.futures import ProcessPoolExecutor, as_completed
from dh import cprint, read_lines
from loguru import logger
from pathlib import Path
from urllib.parse import urljoin, urlparse
fslint .
fupf
fur
furls
future1 = executor.submit(read_file_task, path1, use_mmap1)
future2 = executor.submit(read_file_task, path2, use_mmap2)
futures = [
fzf
fztrans
g1 alexpasmantier/pymple.nvim
g1 chrisgrieser/nvim-kickstart-python
g1 dotlas/cookiecutter-pypackage
g1 fonttools/fonttools
g1 https://github.com/Alexis12119/nvim-config
g1 https://github.com/audreyfeldroy/cookiecutter-pypackage
g1 https://github.com/bradagi/awesome-cli-coding-agents
g1 https://github.com/chrisgrieser/nvim-kickstart-python
g1 https://github.com/cjolowicz/cookiecutter-hypermodern-python
g1 https://github.com/jedwing/CHMLib
g1 https://github.com/kragniz/cookiecutter-pypackage-minimal
g1 https://github.com/zverok/spylls
g1 life4/flakehell
g1 pdfminer/pdfminer.six
g1 pyenv/pyenv
g1 pypa/hatch
ga
ga 
gagc
gb
gc
gc '0'
gc '1'
gc '3'
gc '4'
gc '5'
gc '6'
gc '7'
gc '8'
gc '9'
gc 'codeart'
gc 'copilot'
gc 'doc'
gc 'gemini'
gc 'init'
gc 'lazy'
gc 'lazyvim'
gc 'new'
gc 'shell branch'
gc 'shell branch2'
gch 0.1
gch 068fc642ae705aa0c71732db4b77d342e5b
gch 1.16.1
gch 1.16.14
gch 1.23.1
gch 1.28.2
gch 17a2974a
gch 1edfc00
gch 2.20
gch 2.44
gch 206011a8bc5078a02560d5c44177e9849e8
gch 2a6940a
gch 31e3c38
gch 3566f1c3
gch 3aab214
gch 427b576c
gch 4f1f0e8
gch 4f1f0e8104f7892920ef847af7e9707456e2b
gch 54c72a9e
gch 5e3c4a3
gch 5f86d1d
gch 63c55f2
gch 6545fbd
gch 65b43bd
gch 6f134f64
gch 6f33db8
gch 6f4cac9
gch 6f65cff
gch 8003f67f
gch 842329a
gch 882c996c
gch 90d0ce6
gch 91f0263
gch 974c888
gch a59d609
gch aa51c20f
gch b25b749
gch bd67efe
gch bf620ac8
gch bff1bd61c
gch bffc983
gch c125074
gch cdc07ac
gch cf12346a
gch copilot
gch d0a56e36
gch d80602c
gch ee2a4e7
gch f060f54
gch f107fab
gch f24582ab
gch f920fcecb
gch lazyvim
gch main
gch master
gch old
gch v0.3.7
gch v1.16.14
gch v2.16.14
gch v2.2
gcli 'hi'
generate_lazy_lock
get switch -
getrepos folke
getsub Shameless.S01E04.480p.SoftSub.DonyayeSerial.mkv
gexcst
gext
gextco2
gfixre
gfixre -a
gh api --help
gh api repos/unforgivenii147/events --paginate
gh api repos/unforgivenii147/fonttools --paginate
gh api repos/unforgivenii147/fonttools/.github
gh api repos/unforgivenii147/fonttools/.github/ --paginate
gh api repos/unforgivenii147/fonttools/events --paginate
gh api repos/unforgivenii147/fonttools/notifications --paginate
gh fork .
gh repi fork  https://github.com/fabric/fabric
gh repo --help
gh repo create pycrypto --public --source=.
gh repo delete bin_sep
gh repo delete fonttools
gh repo delete pysrt
gh repo fork  https://github.com/fabric/fabric
gh repo fork .
gh repo fork https://github.com/python-mechanize/mechanize
gh repo fork pycrypto/pycrypto
gh repo rename --help
gh repo rename nvim
gh repo rename nvim nvim_old
gh repo search hunspell
gh workflow list
ghpy
ghpy10
gif
git --help
git add -A
git alias
git branch -a
git branch codeart
git branch copilot
git branch lazyvim
git branch old
git branch sep
git branch september
git branch shell
git branch single_file_setup
git checkout 60c66a6
git checkout master
git clone --depth 1  https://github.com/AstroNvim/template
git clone --depth 1 https://githyb.com/astrovim/template
git clone https://git.astronvim.com/AstroNvim nvim-astrovim
git clone https://github.com/ArtifexSoftware/pipcl
git clone https://github.com/DarrylDias/basic-nvim basic-nvim
git clone https://github.com/LazyVim/starter nvim-lazyvim
git clone https://github.com/NeogitOrg/neogit
git clone https://github.com/NeogitOrg/neogit --verbose
git clone https://github.com/NvChad/starter nvim-nvchad
git clone https://github.com/SirVer/ultisnips
git clone https://github.com/bradAGI/awesome-cli-coding-agents
git clone https://github.com/doctorfree/nvim-lazyman nvim-lazyman
git clone https://github.com/harrisoncramer/harrisoncramer.me
git clone https://github.com/harrisoncramer/nvim
git clone https://github.com/nvim-lua/kickstart.nvim nvim-kickstart
git clone https://github.com/serge-sans-paille/gast
git clone https://github.com/unforgivenii147/nvim
git clone https://github.com/zebbern/no-cost-ai
git clone https://github.com:DarrylDias/basic-nvim basic-nvim
git clone https://sourceforge.net/hunspell/hunspell
git clone https://sourceforge.net/projects/hunspell/
git commit -m '2'
git config  set  advice.detachedHead false
git config  set global advice.detachedHead false
git config global set advice.detachedHead false
git config list
git config pull.rebase false
git df
git dif
git diff
git diff zs.py
git init
git lg
git lig
git log
git log --oneline -5 && git remote -v
git lua
git pull
git pull main
git push
git push --force
git push --set-upstream origin shell
git push origin HEAD:main
git push origin HEAD:main --force
git push origin HEAD:master
git reflog
git remote add main https://github.com/unforgivenii147/bashbin
git repack
git reset --hard
git reset --hard HEAD
git reset --hard HEAD~1
git revert 60c66a6
git rm dic2.json
git rm dictionary.json
git rm words
git st
git status
git submodule --help
git submodule update --init --recursive
git switch -
git switch codeart
git switch sep
git switch september
git switch shell
git tag
git tag -r
git tag -s
git tsg
git update-index --skip-worktree .github/
git yag -r
git_differ
git_fiffer
gitdif
gitkeepmain
gitsubmodule
gittag
gittsg
gitui
gl
gll .bash_history 4388
gll 002.mhtml 1 766
gll 30b998696efcb1d.css 1 3
gll README.md 196 327
gll README.md 296 327
gll autofix_typo 19 45
gll failed.txt 11489
gll hmin 40 68
gll hmin.py 40 99
gll index.html 204 585
gll lib.rs 185
gll options.lua 6 87
gll py.txt 1 24
gll test_model_service.py 1 15
gp
grc AckslD/swenv.nvim
grc AnsonH/copy-python-path.nvim
grc DaewooKim/daily-ai-news-brief
grc DaewooKim/daily-ai-news-brief -- --depth 1 --single-branch --branch maingsz
grc Floobits/floobits-neovim
grc SUSTech-data/neopyter
grc Silletr/LazyDeveloperHelper
grc alec-gibson/nvim-tetris
grc alexpasmantier/pymple.nvim
grc benlubas/molten-nvim
grc dccsillag/magma-nvim
grc fonttools/fonttools
grc fonttools/fonttools -- --depth 1
grc hat0uma/prelive.nvim
grc holman/dotfiles
grc holman/dotfiles holman_dotfiles
grc https://github.com/SirVer/ultisnips
grc https://github.com/fabric/fabric
grc https://github.com/lambdalisue/dotfiles
grc https://github.com/milesgranger/cramjam
grc https://github.com/pemistahl/lingua-py
grc https://github.com/pycrypto/pycrypto
grc https://github.com/pyhunspell/pyhunspell
grc https://github.com/python-mechanize/mechanize
grc jim-fx/sudoku.nvim
grc jlc/envim
grc jpmcb/nvim-llama
grc kiyoon/jupynium.nvim
grc kiyoon/nvim-hand-gestu
grc kiyoon/nvim-hand-gesture
grc kiyoon/python-import.nvim
grc lambdalisue/neovim-plu
grc lambdalisue/neovim-plug
grc lambdalisue/neovim-plugin
grc neolooong/whichpy.nvim
grc neovim/python-gui
grc nvim-neotest/neotest-python
grc nvimdev/nvim-plugin-template
grc ok97465/ipybridge.nvim
grc ricmonmol/nvim-music-player
grc romlok/python-debian
grc unforgivenii147/bin
grc unforgivenii147/bin_sep
grc wsdjeg/code-runner.nvim
grc xiangnongWu2233/rubiks-cube.nvim
grep -RInE   'flake8|Application|StyleGuide|Checker|Plugin|Violation|OptionManager|parse_options|make_checkers|run_checks'   flakeheaven pyproject.toml
grmc
grmc -c
grmc grmc.py
grr
gs
gsgc
gsz DaewooKim/daily-ai-news-brief
gsz chrisgrieser/nvim-kickstart-python
gsz https://github.com/Alexis12119/nvim-config
gsz https://github.com/ArtifexSoftware/pipcl
gsz https://github.com/VahidN/EnglishToPersianDictionaries/
gsz https://github.com/google/pytype
gsz https://github.com/googleapis/python-genai
gsz https://github.com/harrisoncramer/nvim
gsz https://github.com/jedwing/CHMLib
gsz https://github.com/jianfch/stable-ts
gsz https://github.com/milesgranger/cramjam
gsz https://github.com/pemistahl/lingua-py
gsz https://github.com/pyhunspell/pyhunspell
gsz https://github.com/pymupdf/pymupdf
gsz https://github.com/serge-sans-paille/gast
gsz https://github.com/unforgivenii147/neovim_source
gsz https://sourceforge.net/projects/hunspell/
gsz romlok/python-debian
gtop
gunzip Git.3pm.gz
gunzip index.html.gz
gzip --help
gzip -9 *.tar
gzip -9 mupdf-1.26.10-source.tar
h
h5~v;unspell -L template2
hasd9c
hasdoc
hasdoc -a
hatch --help
hatch -h
hatch build
hatch build --help
hatch build .
hatch init ttt
hatch init zoxide
hatch install .
hatch new ttt
hatch new zoxide
hch 2.44
head -n 30 requirements.txt > hh
head Jamfile-engine | tcs2
head fail.txt
head fail.txt |tcs2
head req.txt > hh
head requirements.txt > hh
hejri
hejri.py
heredocs2py 011.sh
heredocs2py 11.sh
hijri
history | grep black
history | grep numpy
hll 30b998696efcb1d.css 1 3
hmin
hmin SpaceVim.html
hmin StartMason.html
hmin.py
htmin
html-beautify persiandate.html >> pdate.html
html-beautify source2.html >> s2.html
html-beautify source3.html >> s3.html
html-minifier --help
html-minifier trait.html -o trait2.html
html-minifier-terser --help
html-minifier-terser async.html
html2pdf answers.html
html_entity
html_entity urls.txt
html_minify_py
html_tag_balancer
html_tag_balancer --help
html_tag_balancer -a
html_to_md
htmlbeautify source4.html
htmlformat
hunspell  template
hunspell  template2
hunspell -- version
hunspell --help
hunspell --version
hunspell -D
hunspell -L quotes.json
hunspell -L template2
hunspell -l upkl.py
hunspell quotes.json 
hunspell upkl.py
if __name__ == "__main__":
if __name__ == "__main__":;     main() Refactor this Python script with the following changes:
if lines1_count > 10000 and lines2_count > 10000:
if mode == "only_in_first":
if only_in_first:
if only_in_second:
if test ${BASH_VERSION%%.*} -ge 5 && [[ ${PROMPT_COMMAND@a} == *a* ]] 2> /dev/null; then    eval "PROMPT_COMMAND+=( 'pwd>&8;kill -STOP $$' )";  else    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND }'pwd>&8;kill -STOP $$';  fi
img2art example3.png
img2art example4.png
img2txt
imgviewer screenshot_from_discord.png
import base64
import mimetypes
import re
import requests
import sys
import time
imports
imports -s
inc
include
info aspell-dev.info > aspell-dev.md
info aspell.info
info aspell.info > aspell.md
info wget
info wget >wget.md
info wget.info --output=- | w3m -T text/html > output.html
info2md
init_project -s -d test2
init_project -s ttt
init_project libscanbuild
init_project test2
initproj ttt
ipython
isort .
isort build_single_page
isort imports.py 
isort perpage_20260816_142037.py
isort pp_pdfminer.py
ja
java --version
java -jar Notepad.jar
java -jar SampleTree.jar
java -jar SampleTree.jar .
java -jar langdetect.jar ../europarl.test
java -jar langdetect.jar .personal_dict
javac SampleTree.java
jb
jb 
jb -m
jb -s
jb -s en.json
jb .dns
jb .myinfo
jb .neoconf.json
jb .prettierrc
jb class_duplicates.json
jb constant_duplicates.json
jb dictionary.json -s
jb function_duplicates.json
jb hunspell_enfa.json
jb javascript.json
jb lazy-lock.json
jb lazyvim.json
jb lazyvim.json 
jb lua.json
jb p.json
jb package.json
jg
jhenrygassolubilityoptimization.m
joinlines f2c.py 
jp.py --ast jp.py
jp.py --help
jp.py -f jp.py --ast
jp.py -f jp.py --ast import
jp.py -f jp.py import
jpo
jpo.py
jupyter notebook
ka
keep_latest_version
kite-http
klin
kll
ks
l
l gptagqrnmk.css
l9b
lS
la
la'
lapllpp gdka2Cj9bavr
lastncommits 1
lastncommits 2
lastncommits 3
lastncommits 4
lastncommits 6
lastncommits.py 2
lastncommits.py 4
lazydir
lazydit
lazydur
lazysync
ld
ldd --help
lib
liname
lines = read_lines(path,ke=False) # ke -> keepends
lines1_count = count_lines(path1)
lines2_count = count_lines(path2)
lizard yap.py
lkk .so
lkk 10
lkk 16
lkk 312
lkk _1
lkk _1.py
lkk _2.py
lkk add
lkk afk
lkk anyio
lkk aspell
lkk bash
lkk big
lkk bin
lkk blob
lkk br
lkk brotli
lkk c_
lkk cairo
lkk cffi
lkk cld
lkk clean
lkk clon
lkk commit
lkk compile
lkk concurrent
lkk cpp
lkk cryptography
lkk cst
lkk ddd
lkk debug
lkk detect
lkk dh
lkk diff
lkk dir
lkk dirs
lkk django
lkk doc
lkk dup
lkk escap
lkk ex
lkk extract
lkk fiff
lkk figlet
lkk file
lkk find
lkk fix
lkk flake
lkk flake8
lkk font
lkk fzf
lkk gemini
lkk getfile
lkk getfiles
lkk ghpy
lkk git
lkk glm
lkk html
lkk http
lkk hunspell
lkk ide
lkk img
lkk init
lkk inlin
lkk java
lkk jdk
lkk js
lkk ko
lkk kos
lkk lab
lkk lazy
lkk link
lkk llh
lkk log
lkk lzma
lkk markdown
lkk mason
lkk md
lkk merge
lkk min
lkk module
lkk move
lkk movi
lkk neo
lkk netifac
lkk nutr
lkk nvim
lkk ocr
lkk octo
lkk orphan
lkk pdf
lkk pickl
lkk pip
lkk pipdown
lkk pkg_res
lkk plumb
lkk png
lkk pret
lkk proj
lkk protoc
lkk pure
lkk py
lkk pyget
lkk pyi
lkk python
lkk radon
lkk record
lkk reinst
lkk rename
lkk req
lkk resourc
lkk rm
lkk rmc
lkk scr
lkk scra
lkk scrap
lkk setuppy
lkk sh.
lkk shebang
lkk singl
lkk snack
lkk spel
lkk spell
lkk spyl
lkk sqlit
lkk sqlite
lkk srt
lkk stand
lkk sub
lkk sum
lkk symbols
lkk tag
lkk tar.zst
lkk term
lkk test
lkk textual
lkk thonny
lkk toml
lkk tree
lkk tree-sitter
lkk tree_sitter
lkk tree_sitter > ls
lkk typ
lkk type
lkk update
lkk view
lkk vim
lkk woff
lkk za
lkkb.so
ll
ll -l
ll -r
lla
llib
lll
llll
llvm-PerfectShuffle
llvm-PerfectShuffle --help
llvm-PerfectShuffle llvm-PerfectShuffle
ln -l dic_fa.json
ln -l python python3.12
ln -s ../lib/node_modules/js-beautify/js/bin/htmlbeautify.js htmlbeautify
ln -s ../libtree-sitter-rust.so rust.so
ln -s ../packages/debugpy/debugpy debugpy
ln -s ../packages/debugpy/debugpy-adapter debugpy-adapter
ln -s ../packages/pyright/node_modules/.bin/pyright pyright
ln -s ../packages/pyright/node_modules/.bin/pyright-langserver pyright-langserver
ln -s ../packages/ruff/ruff-aarch64-unknown-linux-gnu/ruff ruff
ln -s ../pyright/index.js pyright
ln -s ../pyright/langserver.index.js pyright-langserver
ln -s /data/data/com.termux/files/usr/bin/ruff ruff
ln -s dir_size.sh dir_size
ln -s dupwaste.py dupwaste
ln -s edu.sh edu
ln -s fa-IR.aff fa.aff
ln -s fa-IR.dic fa.dic
ln -s fixdup.py fixdup
ln -s fontconverter.py fco
ln -s lS.sh lS
ln -s libhunspell-1.7.so libhunspell.so
ln -s md5sum_approx.py md5sum_approx
ln -s merge_hardlinks.py merge_hardlinks
ln -s pip pip3
ln -s pip pip3.12
ln -s python python3.12
ln -s python3.12 python3.14
ln -s random_font.py rfr
ln -s repos/pwords/words/persian.json dic_fa.json
ln -s repos/pwords/words/words.json  dic.json
ln -s tree_sitter/ tree-sitter
ln -s ~/.termux/font.ttf font.ttf
lob
logger.add(
logger.remove()
loname
loname -r
lower_keys uper.json
lowerer failed.txt
lowerer failed_fa.txt
lq
ls
ls 
ls *.cloning
ls *.gz
ls *.html
ls *.info*
ls *.json
ls *.log
ls *.mkv
ls *.pdf
ls *.pth
ls *.py
ls *.pyz
ls *.sh
ls *.so
ls *.srt
ls *.toml
ls *.txt
ls *.xz
ls *.zst
ls *1.py
ls *_1
ls *_2
ls *zs*
ls -a
ls -l
ls -l  optwin.lua
ls -l  python
ls -l .gitignore
ls -l c.so
ls -l css
ls -l dic_fa.json
ls -l furls.py
ls -l jsx
ls -l parser
ls -l pusher.sh
ls -l pypi.html
ls -l pyproject
ls -l python
ls -l python*
ls -l rename_html_by_title.py
ls -l rename_html_by_title.py 
ls -l sqlite3
ls -l subl
ls -l to.env
ls .*
ls ..
ls .a
ls .z*
ls > ls
ls >> init.lua
ls a*.py
ls dir*
ls libtree-sitter*
ls lua/astronvim/ >> init.lua
ls zstd*
ls | tcs2
ls |tcs2
ls'
ls.
lsc
lsless
lua/plugins/
luajit scripts/check-queries.lua
lub
lvim
lvim appendr.py
lvim erap.py
lvim ex_abbr.py
lvim rmc
lvim t.py
lvim yap.py
lx
lychee d.html
lz
m
m  create_setup.py mksetuppy.py
m 223.py
m LazyVim.lua
m README.md
m add7db
m add_typing
m afk.py
m all_strings.txt 
m auto_git_fmt.py
m autofix_typo.py
m c2.lua 
m cext.py
m check_rmc.py
m chk_imports
m chk_imports.py
m cleanhash.py
m cleanup_darwin.py
m code_snip_extractor.py
m cpwhl.sh
m create_stub
m ddup_bash_function_names
m doc_detector.py
m dufpy
m embed_optimizer.py
m erap
m erap.py
m errors.py
m f2base64.py
m fix_escape.py
m fixext.py
m font_converter.py
m furls.py
m gfixre.py
m glm5.py
m gmp.info-1
m grmc.py
m html_minify_py
m indent-blankline.lua
m indent-blankline.spec
m init_project
m jobutils.py
m list_files_starting_with.py
m lua.lua
m magickcv.py
m mdview.py
m mimeapps.list
m mini_html.py
m mk_deptree_svg.py
m mk_stand.py
m mk_standalone.py
m mktree.py
m mkx.py
m move_tests_dirs.py
m nul-ls.lua
m options.lua
m options.lua 
m out.lua 
m pd2u.py
m perpage.py
m perpage2.py
m pkg_resources_reporter_autofixer.py
m pngq.py
m pp_pdfminer.py
m py_dev.py
m py_reinstaller.py 
m python.lua
m q24
m quotes.json
m random_font.py
m refactor_proj.py
m rename_html_by_title.py 
m rfr
m rmc
m rmc.py
m rmcst.py
m rpack.py
m sanity1.py
m siddhi.init.lua
m snacks.lua
m soverify.py
m srtshift.py
m sumr_nltk.py
m t.py
m t.py 
m telescope.lua
m telethon1.py
m ter_ser
m termimg.py
m test2.py
m test_url.py
m theme-switcher.lua 
m trailing.py
m transliterator.py
m ufo.lua
m ui.lua
m vimhelpers.py
m x5.py
m x5.py 
m xreport2.py
m xxx.py 
m yap.py
m zs.py
m zsr.py
m zstder.py
m ~/bin/autoclone.py
m ~/bin/mk_standalone
ma
magickcv  *.jpg *.png
magickcv Screenshot_20260813-090320.jpg
magickcv Screenshot_20260813-090320.jpg a.png
make
make -j6
make all
make bats
make build
make check
make clean
make format
make html
make install
make lint
make src/parser.c
make test
make tree
make uninstall
man not
man_do
man_doc
man_doc --help
man_doc FileCheck.1.gz
markdownify index_36.html
markdownify my_lazy_neovim_config_dev_community.html
masondir
masondr
mat mason-lspconfig.lua >> mason.lua
matur
maturin --version
matut
mb rulesruff1.md ruff_rules.md
mb showfigfonts showfigfonts.1
mb ~/fh.py .
mc
mc_print_command_buffer () { printf "%s\\n" "$READLINE_LINE" >&10; }
md .cargo
md .local
md .venv
md 0
md 1
md 10
md 11
md 2
md 3
md 480
md 6
md 7
md 720
md 7z
md 8
md 9
md DEBIAN
md a
md add_type_hints
md addtype
md after
md ai
md airank
md anti
md apps
md archivd
md arena
md arm
md asymmetrics
md autocmd
md autoload
md backends
md bb
md bin
md body
md br
md buid_cross
md chargoon
md chat_client
md ciphers
md colorschemes
md completion
md config
md congig
md constantly
md core
md cryptography
md css
md cst
md d
md dap
md deb
md debugpy
md difg
md doc
md en
md examples
md fa
md fastwalker
md felo
md fh8
md fix
md flake8
md font
md fontello
md fonts
md free_tier
md ftdetect
md ftplugin
md gemini
md gensim
md git_analizer
md gz
md hazat
md hex
md ht,
md html
md hunspell
md i
md info
md internal
md joblib
md keymaps
md l
md langdetect
md lazy
md lib
md lingua
md log
md lsp
md lua
md lua/config
md lua2
md lunar
md m
md main
md man
md master
md md /sdcard/
md merged
md mhr
md mht
md mhtml-to-html
md misc
md mistral
md mu
md myna
md n
md new
md normal
md nvim
md nvim-lazyvim
md nvim-nvimesle-adamizad
md nvim_perplex
md nvim_textual
md nvim_trend
md old
md openrouter
md openrouter/
md options
md orig
md p
md pcurl
md pdf.js_wrapper
md pip
md pipsearch
md pkg
md pkgs
md plug
md plugin_template
md plugins
md prettier
md primitives
md projects
md puter
md py
md pyarchive
md pychm
md pydirb
md pyget
md pymupdf
md pypdfium2
md pyprettier
md query
md questionai
md regular
md repos
md rust
md s
md s11
md scripts
md sh
md shell
md site
md snippets
md split
md splitted
md sql
md src
md srt
md summarize
md svgo
md t
md t3
md template
md test
md test2
md tests
md textaul_nvim
md tgz
md themes
md thonny
md tornado
md tree-sitter
md treesitter
md ts
md tsvim
md ttt
md typing
md ui
md unforgivenii147
md utils
md uv
md v1
md v2
md vendor
md versions
md vim
md watch_and_save
md webster
md wheels
md whisper
md whl
md workspace
md x
md x509
md z
md zip
mdv README.md 
mdv ch03.md 
mdv if_pyth.txt
mdview README.md
mdview readme.md
mdviewer README.md
mendic
merge_enfa
merge_faen
merge_pkg
merge_pkg  .  agpush.py
merge_pkg . fa.py
merge_pkg . fh.py
merge_pkg . out
merge_pkg . pyget
merge_pkg . pyget.py
merger
merger -c
merger -e lua
merger options.lua options2.lua
mfadic
mhtml-to-html 01.mhtml
mhtml-to-html 02.mhtml
mhtml-to-html a.mhtml
mhtml-to-html aiweb.mhtml
mhtml-to-html chargoon.mhtml
mhtml-to-html d.mhtml
mhtml-to-html default_rules___ruff_1.mhtml 
mhtml-to-html free.mhtml 
mhtml-to-html hello.mhtml
mhtml-to-html how.mhtml
mhtml-to-html i.mhtml
mhtml-to-html intro.mhtml
mhtml-to-html llm.mhtml
mhtml-to-html note1.mhtml
mhtml-to-html note2.mhtml
mhtml-to-html nvim.mhtml
mhtml-to-html pdfium.mhtml
mhtml-to-html pymu.mhtml
mhtml-to-html rules___ruff_1.mhtml 
mhtml-to-html spellp.mhtml
mhtml-to-html z.mhtml
mhtml2html turtle.mhtml
migrate_cf2mp
minify --help
minify --html markdeep.html
missingfiles
mk_deptree_svg.py
mk_stand
mk_stand  md_viewer_tother.html
mk_stand .
mk_stand FileCheck.1.html
mk_stand hello.html
mk_stand mdviewer.html
mk_stand providers.html
mk_stand thonny.html
mk_standalone
mk_standalone chargoon.html
mk_standalone d.html
mk_standalone felo_thonny.html
mk_standalone fontpreview.html
mk_standalone freeai.html
mk_standalone index.html
mk_standalone learn-lua.html
mk_standalone markdown_viewer.html
mk_standalone source1.html
mk_standalone source2.html
mk_standalone thonny.html
mk_standalone z.html
mk_stanfd
mkart
mkart 'سلام'
mkart_en
mkc
mkdir -p ~/.vim/pack/plugins/start/vim-toml
mkdir body
mkdir python3.12
mkdir site-packages
mkdir tmp
mkdir typings
mkpic
mkpic -o 2 -l
mkstand
mkstand front.html
mktree
mktree tree.txt
mkx
mm
mn ../../en.json .
monolith -e  https://pypi.org/pypi/_/json -o pypi.html
monolith -e  https://pypi.org/simple  -o pypi.html
monolith -e  https://pypi.org/simple/json -o pypi.html
monolith -e -i -v https://aitools.aiting.com/ranking -o ranking.html
monolith -e -i -v https://aitools.aiting.com/ranking/japan -o j.html
monolith -e -i -v https://aitools.aiting.com/ranking/japan -o rankingjapan.html
monolith -e https://chat.mistral.ai/work/a5dded07-db02-4160-aa26-aafb5ba9b45d -o fanar.html
monolith -e https://dev.to/voyeg3r/my-lazy-neovim-config-3h6o -o neovim.html
monolith -e https://g4f.dev/playground/#/providers -o providers.html
monolith -e https://programmingfonts.org -o pfonts.html
monolith -e python_concurrency_with_asyncio_matthew_fowler.pdf.html -o p.html
monolith -i -v -e https://g4f.dev/playground/#/providers -o providers.html
move_dirs
move_lines 1.mhtml 1 2 url
move_lines 40_99.py 30 50 41.py
move_lines dirb2.py 1 27 pyproject.toml
move_lines dirb2.py 1 29 README.md
move_lines init.lua 1 191 plug.lua
move_lines init.lua 1 97 options.lua
move_lines init.lua 214 225 copilot_keymaps.lua
move_lines py.txt 1 104 readme.md
move_lines py.txt 1 106 restore_historical_deletion.py
move_lines py.txt 1 109 fixisnot.py
move_lines py.txt 1 120 readme.md
move_lines py.txt 1 132 filter_noneng.py
move_lines py.txt 1 132 fix_isnot.py
move_lines py.txt 1 136 vv.py
move_lines py.txt 1 150 fix_escape.py
move_lines py.txt 1 157 readme.md
move_lines py.txt 1 172 pdf_style.css
move_lines py.txt 1 176 invalid_escape_sequence_full.py
move_lines py.txt 1 184 lib.rs
move_lines py.txt 1 186 readme.md
move_lines py.txt 1 192 readme.md
move_lines py.txt 1 197 find_duplicates.py
move_lines py.txt 1 202 readme.md
move_lines py.txt 1 208 readme.md
move_lines py.txt 1 214 md2pdf2.py
move_lines py.txt 1 224 md_to_pdf.py
move_lines py.txt 1 225 readme.md
move_lines py.txt 1 232 lib.rs
move_lines py.txt 1 240 readme.md
move_lines py.txt 1 327 readme.md
move_lines py.txt 1 33 localttf.css
move_lines py.txt 1 62 pdf-style.css
move_lines py.txt 1 7 md2pdf.py
move_lines py.txt 1 80 squash_deletion.py
move_lines py.txt 1 80 v1.py
move_lines py.txt 1 82 invalid_escape_sequence.py
move_lines py.txt 1 89 readme.md
move_lines py.txt 1 92 readme.md
move_lines py.txt 1 96 detect_noneng.py
move_lines q1.md 37 293 rpk.py
move_tests_dirs
move_tests_dirs -d
move_tests_dirs.py -d
mske
mske install
mtn
mv 
mv  mason-lspconfig.lua ..
mv * ..
mv * ../foff2/
mv * /sdcard/md/
mv * ~/projects/lua/
mv *.cpython-312.so ./py/
mv *.css ../css/
mv *.css ./tmp/
mv *.css /sdcard/_static/css/
mv *.html
mv *.html ./html/
mv *.json ..
mv *.json ./done/
mv *.lua ..
mv *.lua ../..
mv *.lua ~/.config/nvim/lua/plugins/
mv *.md ..
mv *.md ./md/
mv *.md ~
mv *.py ..
mv *.py ../py/
mv *.py ./python/
mv *.py ./tools/
mv *.py ./words/
mv *.sh ..
mv *.sh ../sh/
mv *.srt ../series/
mv *.srt ./srt/
mv *.ttf ../../../_static/font/
mv *.vim ..
mv *.whl ..
mv *.woff ../../../_static/font/
mv *.woff2 ..
mv *.woff2 ../..
mv *.woff2 ../../../_static/font/
mv *.woff2 ../woff2
mv *.woff2 ../woff2/
mv *.woff2 ./woff2/
mv *.zip ~/repos/neo_vim/
mv ../*-main .
mv ../*-master  .
mv ../*.480 .
mv ../*.720 .
mv ../*.body .
mv ../*.br .
mv ../*.css .
mv ../*.gz .
mv ../*.html .
mv ../*.lua .
mv ../*.mhtml .
mv ../*.orig .
mv ../*.otf .
mv ../*.py .
mv ../*.sh .
mv ../*.srt .
mv ../*.ttf .
mv ../*.whl .
mv ../*.xml .
mv ../*.zip .
mv ../*Normal.ttf .
mv ../*Regu
mv ../*Regular.ttf .
mv ../*armv8l.whl .
mv ../*dap* .
mv ../*dap*.lua .
mv ../*lsp* .
mv ../*lsp*.lua .
mv ../*treesit* .
mv ../../../binaryornot.tar.xz .
mv ../../dirb2.py .
mv ../../en.json .
mv ../../external.txt .
mv ../../fa.json  .
mv ../../fh8.py .
mv ../../may/zai/dirb2.py .
mv ../296k-404k/*.ttf .
mv ../CHMLib/ .
mv ../Download/*.srt .
mv ../addtype.py .
mv ../allinone.lua .
mv ../b .
mv ../bash_scripts/ .
mv ../bb.txt .
mv ../blink-cmp.lua .
mv ../blink.lua .
mv ../chargoon.html .
mv ../control .
mv ../cpp .
mv ../d.html .
mv ../data_sql.json .
mv ../edge.lua .
mv ../en.json .
mv ../enfa.json .
mv ../everforest.lua .
mv ../example.py .
mv ../fa.txt .
mv ../failed.txt .
mv ../failed_fa.txt .
mv ../felo.txt ./lua/config/
mv ../final_en.json e.json
mv ../flake8-4.0.0-py2.py3-none-any.whl .
mv ../flake8/ .
mv ../get_ipynb.py .
mv ../h/* .
mv ../huffman_coding/ phuff
mv ../hunspell.txt .
mv ../indent-blankline* .
mv ../isaac/js .
mv ../isaac/pkgs py
mv ../lazy* .
mv ../lazy.lua .
mv ../lingua_language_detector-2.2.0-cp314-cp314-win_arm64.whl .
mv ../lsp* .
mv ../lualine* .
mv ../luasnip.lua .
mv ../lunarvim/site/pack/lazy/opt/ .
mv ../lxml-6.1.1-cp312-cp312-linux_armv8l.whl .
mv ../mason* .
mv ../mason-* .
mv ../mason.lua .
mv ../mason_1.lua .
mv ../mupdf/* .
mv ../nightfox.lua .
mv ../nvim-* .
mv ../nvim/*.vim .
mv ../nvim_old/ .
mv ../o01.lua .
mv ../o02.lua .
mv ../o03.lua .
mv ../o04.lua .
mv ../onedark.lua .
mv ../opencode.lua .
mv ../pip .
mv ../pip* .
mv ../pip-20.3.4-py2.py3-none-any.whl .
mv ../pip-26.1.2.dist-info/ .
mv ../pip-26.2.1-py3-none-any.whl  .
mv ../plugins.lua .
mv ../py.txt .
mv ../python.json .
mv ../python.lua .
mv ../repos.txt .
mv ../rpds_py-2026.6.3-cp312-cp312-linux_armv8l.whl .
mv ../rpds_py-2026.6.3-cp312-cp312-linux_armv8l\ \(1\).whl .
mv ../scipy-1.16.3-cp312-cp312-linux_arm.whl .
mv ../simz.json .
mv ../sonokai.lua .
mv ../telescope* .
mv ../termux-packages/ .
mv ../tessdata_best/* .
mv ../tree.txt  .
mv ../tree.txt .
mv ../treesitter* .
mv ../treesitter.lua .
mv ../words.json .
mv ../workspace-01a068b1-6e03-7849-9ff5-41e443c3234d.zip .
mv ../z.html .
mv ./home/.config/nvim/ nvim
mv ./~ home
mv .bashrc ..
mv .config/ ..
mv .config/ nvim
mv .git ..
mv .git ./mupdf/
mv .gitignore ..
mv .gitignore ~/.gitignore_all
mv .gitignore ~/bin/
mv .stylua.toml ./.config/nvim/
mv .stylua.toml ~/.config/nvim/
mv /sdcard/*.zip .
mv /sdcard/Download/* .
mv /sdcard/Download/*.7z .
mv /sdcard/Download/*.deb .
mv /sdcard/Download/*.gz  .
mv /sdcard/Download/*.gz .
mv /sdcard/Download/*.html .
mv /sdcard/Download/*.mhtml .
mv /sdcard/Download/*.py .
mv /sdcard/Download/*.tar* .
mv /sdcard/Download/*.whl .
mv /sdcard/Download/*.xz  .
mv /sdcard/Download/*.zip .
mv /sdcard/Download/*.zst .
mv /sdcard/Download/blink.cmp.tar.xz .
mv /sdcard/Download/chm_lib.h ~/.local/include/
mv /sdcard/Download/deep* .
mv /sdcard/Download/ffff
mv /sdcard/Download/mhtml/my-lazy-neovim-config-3h6o.html .
mv /sdcard/Download/py .
mv /sdcard/Download/sh .
mv /sdcard/Download/txt .
mv /sdcard/_static.tar.xz .
mv 0 bin
mv 0 mason
mv 0.srt 5.srt
mv 00
mv 000.json ..
mv 01_fa_1
mv 038.sh cf2mp.py
mv 05.srt 15.srt
mv 06.sh 06.py
mv 0c ..
mv 1.md pdfview2.html
mv 10.sh 10.py
mv 11 ./nvim-astrovim/
mv 11489.txt fa.txt
mv 12.sh 12.py
mv 122k-10M/* .
mv 13.sh 13.py
mv 14.sh 14.py
mv 185.rs lib2.rs
mv 196_327.md tokyo.lua
mv 1_15.py lic
mv 1_24.txt q.txt
mv 1_766.mhtml 02.mhtml
mv 2.17.18/ 2.7.18
mv 2.lua 1 57 options.lua 
mv 204_585.html mk_stand2.py
mv 296_327.md tokyo.lua
mv 2_to_3.py 
mv 2_to_3.py 223.py
mv 2to313.py my2to3.py
mv 40_99.py 40.py
mv 4388 ./tmp/deb/
mv 480/get_sub.py ..
mv 480/taboo.480 .
mv 5_powerful_text_summarization_techniques_in_python..html text_summerization.htnl
mv 6 ./lua2/6.lua
mv 628k-35M/* .
mv 7e817c84992118bc2ebd0549da594d9dc156d00349dd1efe8c5fab4dcbf2bc00.bin a.css
mv Alternative\ App\ Installation\ Methods.mhtml  a.mhtml
mv Cilantro_Code_Mono-Regular.woff2 ..
mv D2Coding_ligature-Regular.ttf font.ttf
mv Download/*.srt ./series/
mv ExampleIconsPrivate_resources_1/ ExampleIconsPrivate_resources
mv FREE_AI_Regex_Generator__Generate_Regex_Expression_Online.mhtml free.mhtml
mv FontAwesome-Regular.woff2 ..
mv Free_AI_Chat_Online_–_GPT-5\,_Gemini_\&_More_｜_NoteGPT.mhtml note1.mhtml
mv Free_AI_Chat_Online_–_GPT-5\,_Gemini_\&_More_｜_NoteGPT_\(1\).mhtml note2.mhtml
mv Geist-Regular.ttf ../font/
mv HOME.lua options.lua
mv Installation_-_PyMuPDF_documentation.mhtml pymu.mhtml
mv Jamfile-engine ~/.local/bin/
mv LLMPlayground\ –\ Open-Source\ AI\ Chat\,\ Roleplay\ \&\ Coding\ Playground.mhtml llm.mhtml
mv Lib/ src
mv PU02.sql ..
mv Parallel\ Pathlib\ LZMA\ Compressor\ ·\ Tinfoil\ Private\ Chat.pdf  tinfoil.pdf
mv Parallel\ spellchecker\ -\ DeepSeek.mhtml spellp.mhtml
mv PressStart2P.bin PressStart2P.ttf
mv PyMuPDF-1.16.14/ ..
mv PyMuPDF-1.16.14/ pymupdf1.16.14
mv README.en.md readme.md
mv README.markdown README.md
mv README.md ..
mv README.md README.rst
mv README.md cchardet.md
mv README.md dutree.md
mv README.md jiter.md
mv README.md nh3.md
mv README.md pyncdu.md
mv SFProDisplay-Heavy.ttf font.ttf
mv SF_Pro_Display-Regular.ttf font.ttf
mv Scrapegraph-ai/ scrapegraph-ai
mv Shameless_US__-_1x05_-_Three_Boys.HDTV.FQM.en.srt 0.srt
mv Taboo.2017.S01E07.ORGANiC.English-WWW.MY-SUBS.CO.srt 07.srt
mv Taboo.2017.S01E08.ORGANiC.English-WWW.MY-SUBS.CO.srt 08.srt
mv Taboo.S01E01.480p.Farsi.Dubbed.D1.DonyayeSerial.mkv 01.mkv
mv Taboo.UK.S01E01.1080p.BluRay.x264-SHORTBREHD.en-en.srt 01.srt
mv Taboo.UK.S01E02.1080p.BluRay.x264-SHORTBREHD-en.srt 02.srt
mv Taboo\ -\ 1x03\ -\ Episode\ 3.en-en.srt 3.srt
mv Terminal\ transcript.txt  bash2py.py
mv Terminal\ transcript.txt  misspelled.txt
mv Terminal\ transcript.txt  pyright_errors.txt
mv Terminal\ transcript.txt  trend_py10.txt
mv Tide.nvim/ tide.nvim
mv Users\\Sofring\\AppData\\Roaming\\Kingsoft\\wpslive\\zouyang@kingsoft_com\\storagetmp\\20100529120842_5 a
mv Z.ai\ -\ Advanced\ AI\ Chatbot\ \&\ Agent\ powered\ by\ GLM-5.2.mhtml z.mhtml
mv __about__.py _version.py
mv __init.py __init__.py
mv a a.apk
mv a fix_nvim.txt
mv a.json f.js
mv a.tar.xz ..
mv a.tar.xz ./tmp/
mv a/*.woff2 .
mv a04 a04.tar
mv a04.tar ..
mv a21  a21.tar
mv a21 ..
mv a23 ..
mv a23 a23.tar
mv a26 ..
mv a26 a26.tar
mv aaa.py ..
mv abbrevi.txt  bb.txt
mv adder.py ..
mv addtype.py ..
mv aerial.nvim/ ~/projects/lua/
mv afg 2.html
mv annot.html add_stub.py
mv ans.md ../..
mv ans.md merge_pkg.py
mv appendr.py erap.py
mv archivd august
mv archive_scan.py ascan.py
mv archive_scan\ \(1\).py ascan2.py
mv assets/ /sdcard/_static/
mv ast-serialize_394067b33224416d8331d15cf8cbeaca/ astserialize
mv astserialize/ ~/repos/download/
mv august/autofix_typo_learner.py .
mv b  py_regex_builder.html
mv b/*.woff2 .
mv basic-nvim/ nvim-basic
mv bb.json ..
mv bbb.py ..
mv big.json ./fa/
mv bin bin_sep
mv bin/* .
mv bin/missing_files.json .
mv bin_sep bin
mv binaryornot.py isbinary.py
mv blink-cmp.lua blink.lua
mv blink.cmp.tar.xz ~/tmp/
mv blink.lua init.lua
mv blink/* .
mv blinkcmp.lua blink-cmp.lua
mv build.sh ..
mv caret.gif /sdcard/
mv chargoon.html ..
mv checkhealth.txt ..
mv chkfont chkfont.1
mv class_diagram_en.py class_diagram.py
mv cld3/ ~/repos/
mv cleaned.json fa.json
mv cleaned.sh ..
mv cma_city_list.json cities2.json 
mv cmake_5fe3225f8f3b40dba48ce090261a8753/ cmake443
mv cmp.lua cmp.orig
mv cmp.orig ./orig/
mv colorful,enu.lua colorfulmenu.lua
mv commands.sh ..
mv compile_most_used.sh.sh compile_most_used.sh
mv compile_previse ..
mv compile_previse.py compile_precise.py
mv completion.lua cmp.orig
mv completion.spec completion.lua
mv completion/blink.lua blink-cmp.lua
mv completion/cmp.lua nvim-cmp.orig
mv config.nvim-main/ ~/repos/neo_vim/
mv conform.nvim ..
mv congig/ config
mv convert2to3.py 2232.py
mv convert_to_dic.py ..
mv cookiecutter-hypermodern-python cc-hypermodern
mv cookiecutter-pypackage cc-pypkg
mv cookiecutter-pypackage-minimal/ cc-minimal
mv cookiecutter-pypackage/ pypackage
mv cookiecutter-pypackage/ ~/repos/
mv copilot.lua co.spec
mv copilot.lua copilot.spec
mv copilot.spec copilot.lua
mv copilot.vim/ ~/projects/lua/
mv cpwhl.sh ..
mv crawl_movie_site.py scrap_site.py
mv crawler.py scrapr.py
mv cspell.lua ~/.config/nvim/lua/plugins/
mv d.html ..
mv d7 ..
mv data_sql.json ..
mv ddd2.py ddd2.cpp
mv ddup_bash_function_names.py ~/.config/bash.d/
mv ddup_bash_functions.py ~/.config/bash.d/
mv detect_multilune_text.py detect_multiline_text.py
mv dh/fileutils.pyi .
mv dh/run_parallel.pyi .
mv dic.json en.json
mv dic.json fa.json
mv dic.json ~/repos/pwords/
mv dic.json\ -\>\ repos/ dic.json
mv dic0_1.json dic0.json
mv dic2.json ~/repos/pwords/
mv dic_en_fa.json  dicenfa.json
mv dic_fa.json ..
mv dic_fa.json\ -\>\ repos/ dic_fa.json
mv dic_fa_en.json ..
mv dic_fa_en.json dic.json
mv dicenfa.json hunspell_dic.json
mv dictionary.json dic.json
mv dictionary.json dic0.json
mv dictionary.json dic2.json
mv dictionary.json dic3.json
mv diegopenilla_ChatBot-Python-Telegram_\ Creating\ a\ custom\ bot\ with\ Telegram\ and Python.7z d.7z
mv diegopenilla_ChatBot-Python-Telegram_\ Creating\ a\ custom\ bot\ with\ Telegram\ and Python.mhtml d.mhtml
mv diff_report.json ..
mv difg diff
mv dir dir1.info
mv disable_lua_ls.spec disable_lua_ls.lua
mv dmp.py pydmp.py
mv doc-debtags doc-debtags.py
mv doc.tar.xz ~
mv docs aiohttp_docs
mv docs gevent_docs
mv docs.tar.xz installer_docs.tar.xz
mv docs.tar.xz jupyterlab.tar.xz
mv docs.tar.xz setuptools_docs.tar.xz
mv docs/ piptools_docs
mv dotfiles dot_filez
mv dotfiles/ dot_file
mv download_ipynb.py get_ipynb.py
mv downloads/cramjam-2.12.1.tar.gz .
mv duck.ai_2026-09-03_01-58-43.txt ab
mv duck.ai_2026-09-03_02-04-49.txt abb2.json
mv edge.lua ui.lua
mv en.jso en.json
mv en.json ..
mv en.json dic_en_fa.json
mv en/* .
mv en_freq.json ..
mv enfa.json ..
mv enfa.json ../en.jso
mv enfa.json ../final_en.json
mv enfa.json en.json
mv enfa.json en2.json
mv enfa_failed.json f
mv epizsgpbks.css bootstrap4.4.1.min.css
mv errors.json ./fa/
mv europarl.test ..
mv ex_com.py ..
mv examples/ ~/isaac/pkgs/dh2/
mv external.txt ..
mv f.js a.json
mv fa.json ..
mv fa.json ...
mv fa.json ./words/
mv fa.json dic_fa_en.json
mv fa.py ..
mv fa.py ~/isaac/pkgs/dh2/src/dh2/
mv fa.txt ~/repos/pwords/
mv faen faen.py
mv faen.json ../final.py
mv fail.txt abbr.txt
mv faild.json abbr.json
mv failed-en.txt fail.txt
mv failed.txt en.txt
mv failed.txt ~/repos/pwords/
mv failed_fa.txt f.txt
mv fat.py ./words/
mv felo.txt ../..
mv felo.txt ../plugins/
mv fh.py fh8.py
mv fh.py ~
mv fh8.py __init__.py
mv figlet figlet.1
mv figlist figlist.1
mv file.py pfzf.py
mv files\ \(1\).zip f.zip
mv fileutils.py,cover fileutils_cover.py
mv final.py final_fa.json
mv final_fa.json fa.json
mv final_faen.json fa.json
mv fins_tl_fa.py ftl_fa.py
mv fix_nvim.txt ..
mv flake8 ./src/fh8/
mv flake8/* .
mv floobits-neovim/ ..
mv foff2 woff2
mv font ..
mv font.ttf font1.ttf
mv font.ttf ~/.termux/
mv font_1.ttf font.ttf
mv fonts.tar.xz fonts_sep.tar.xz
mv free,_unlimited_ai_api.html freeai.html
mv fslver fslver.sh
mv fswalker_report4generator.py fswalker_report_gen.py
mv fswalker_report_gen.py ../../tests/
mv git_analizer/* .
mv github-theme.lua ../colorschemes/
mv github_flavour_markdown.css ..
mv github_flavour_markdown.css ../../css/
mv gitub-theme.lua github-theme.lua
mv gmp.md gmp1.md
mv greenlet-3.5.5.tar.gz ~/repos/0/
mv gumbo_3bfd8eac7c1c4c9b815535ff6350f167/ gumbo
mv harrison/ ./neo_vim/
mv hazat/ hazmat
mv hello_agents-1.0.0.tar.xz ~/repos/
mv heredocs2py.py bashtopy.py
mv how\ to\ compile\ pymupdf\ in\ termux\ and\ python3.12\ -\ Stack\ Overflow.mhtml how.mhtml
mv how_to_build_a_simple_ai_web_scraper_with_python_-_kdnuggets_1.mhtml aiweb.mhtml
mv how_to_write_concurrent_python_using_asyncio_1.html async.html
mv html /sdcard/_static/
mv html md
mv html-to-markdown_d59fdf476f6849f28a07694b329b885b/ html-to-markdown
mv html.tar.xz workbook.tar.xz
mv hunspell.txt ~/repos/pwords/
mv hunspell_dic.json ..
mv hunspell_dic.json hunspell_enfa.json
mv hunspell_enfa.json ..
mv hunspell_enfa.json ./en/
mv i\ need\ an\ uptodate\ nvim\ config\ for\ python\ programm...\ -\ Stack\ Overflow.mhtml  i.mhtml
mv indent-blankline.lua ..
mv indent-blankline.lua ibl.spec
mv indent-blankline.spec indent-blankline.lua
mv indentblankline.lua indent-blankline.lua
mv index.htm index.html
mv index.html 1.html
mv index.html nh3_docs.html
mv init init.lua
mv init.lua init.orig
mv init.lua keymaps.lua
mv init.lua plugins.lua
mv init.lua siddhi.init.lua
mv init.orig init.lua
mv init_1.lua mocha.lua
mv install.sh install_reqs.sh
mv install.sh ~/repos/neo_vim/
mv introduction_to_ai_for_work___datacamp_1.mhtml intro.mhtml
mv isaac ..
mv isbinary.py ..
mv java_script_persian_date.html  persiandate.html
mv job_utils.py jobutils.py
mv jobutils.py ../../tests/
mv js-beautify js-beautify.py
mv json/* .
mv jsregexp.so luasnip-jsregexp.so
mv key-maps_2.md keymaps.md
mv ksc5601_hanja.json ..
mv langdetect.jar ~
mv lastplace.spec lastplace.lua
mv lazyvim.plugins.extras.lang.python.lua pylang.lua
mv lezcfcpetb.js mkstand.py
mv lib.rs lib2.rs
mv lib_20_170136.rs ./misc/
mv lib_20_170136.rs lib.rs
mv libchm.py chmlib.py
mv librt_7448c327b5ac4aed95e507841b0719d2/ librt
mv libtree-sitter-* ../share/nvim/
mv libtree-sitter-cpp.so.14.0 cpp.so
mv libtree-sitter-markdown-inline.so.14.0 markdown-inline.so
mv libtree-sitter-markdown.so.14.0 markdown.so
mv libtree-sitter-python.so.15.0 python.so
mv libtree-sitter-tsx.so.14.0 tsx.so
mv libtree-sitter-typescript.so.14.0 typescript.so
mv list_files_starting_with.py
mv local-plugins.lua localplugins.lua
mv lsp-2.lua ../lsp.lua
mv lsp-dap.spec lsp.lua
mv lsp.lua init.lua
mv lsp.lua lsp.orig
mv lsp.lua mason.lua
mv lsp/init.lua lsp.lua
mv lss.py list_files_starting_with.py
mv lua.lua conform.nvim
mv lua.tar.xz ..
mv lua/* .
mv lua/core/*.lua .
mv lua/plugins/init.lua .
mv lualine-2.lua lualine.lua
mv lualine.lua ..
mv lualine.spec lualine.lua
mv lz4-4.4.5-cp312-cp312-linux_armv8l\ \(1\).whl lz4-4.4.5-cp312-cp312-linux_armv8l.whl
mv magivkcv.py magickcv.py
mv main/* .
mv makefile Makefile
mv markdown.html md.html
mv markdown_image_remover.py cleanmd.py
mv markdown_viewer_github_style.html ..
mv markdown_viewer_—_github_style-1.html markdown.html
mv markdown_viewer_—_github_style.html  mdview.html
mv mason.lua init.lua
mv mason.spec mason.lua
mv master/* .
mv matchup.spec matchup.lua
mv md /sdcard/
mv md man
mv md.tar.xz man.tar.xz
mv md/* .
mv md/README.md .
mv meta.htm meta.html
mv mht ../_static/
mv mhtml-to-html/ mhtml_to_html
mv mhtml/* .
mv misc/split_movies/ .
mv missing.txt ..
mv mocha.lua ./colorschemes/
mv mocha.lua init.lua
mv mocha.spec mocha.lua
mv momfxulrpa.js a.json
mv move_lines.py mvl.py
mv mupdf-1.26.10-source.tar.gz ..
mv mupdf_cppyy.py ~/repos/0/
mv my-lazy-neovim-config-3h6o.md my.lua
mv my.lua init.lua
mv my_lazy_neovim_config_dev_community.html  lazyconfig.html
mv mypkg pkg-name
mv neotree.lua ~/.config/nvim/lua/plugins/
mv neotree.spec neotree.lua
mv new ../neo_vim/
mv new/nvim_resources.md .
mv no_extension/* .
mv no_extension/*.json .
mv nvim neo_vim
mv nvim nvim-codeart
mv nvim nvim.bak
mv nvim nvim_old
mv nvim-alexis/ ~/repos/neo_vim/
mv nvim-codeart/ nvim
mv nvim-config/ ~/repos/nvim/alexis
mv nvim-dap-python.lua ..
mv nvim-dap.lua dap.orig
mv nvim-kickstart-python/ ..
mv nvim-lazyvim/ nvim
mv nvim-lsp-config.lua.orig ..
mv nvim-python-config/ ./plugins/
mv nvim-python-config/ p2
mv nvim-treesitter-textobjects/ ~/repos/neo_vim/plugins/
mv nvim-treesitter.lua ../treesitter/
mv nvim-ufo/ ~/projects/lua/
mv nvim.bak/ ~/repos/neo_vim/
mv nvim/* .
mv nvim_old/ ..
mv nvim_old/..
mv nvim_perplex 5
mv nvim_textual/ textual_nvim
mv o10.lua options.lua
mv octohub ..
mv octohub octohub.nvim
mv onedarkpro.orig onedarkpro.lua
mv options.lua ../..
mv options.lua 510 593 3.lua 
mv options.lua opt.lua
mv options.lua options.skel
mv orig /* .
mv orig/* .
mv orig_1/* .
mv out s.py
mv out.lua out1.lua
mv out/* .
mv out/t.pyi .
mv out_1.lua 1.lua
mv out_2.lua 2.lua
mv out_3.lua 3.lua
mv output ~/tmp/
mv output/ jup_trend
mv output/ ~/tmp/
mv p2/*.lua .
mv p2/init.lua .
mv pdate.html persiandate.html
mv pdfdocument.py pdfdocument2.py
mv pdfdocument_20260902_090116.py  pdfdocument.py
mv perpage2.py pp_pdfminer.py
mv perpage_fitz.py pp_fitz.py
mv perpage_plumber.py pp_plumber.py
mv persian.json ./fa/
mv pfzf.py ~/bin/
mv pip-20.3.4.dist-info/ pip-25.0.1.dist-info/
mv pip-25.0.1-py3-none-any.whl ..
mv pip-26.2.1-py3-none-any.whl ~/tmp/
mv pip.tar.xz ..
mv pipdeptree_221136daffe34340901c700a4f6248e3/ pipdeptree
mv plugins.lua ./lua/plugins/
mv plugins.lua init.lua
mv plugins.md req.txt
mv plugins/
mv plugins/ ..
mv plugins/*.lua .
mv plugins/nvim-python-config/ .
mv plugins/octohub.nvim/ ./lua/
mv pool_helper.py ..
mv precise.css ..
mv precise.md ../precise1.css
mv promise-async/ ~/projects/lua/
mv prompt.txt ..
mv pusher.sh.sh pusher.sh
mv py ..
mv py.txt ~/tmp/
mv py/ py2.7
mv py/* .
mv py2.7.tar.xz ..
mv pybcj-1.0.7-cp312-cp312-linux_armv8l\ \(1\).whl pybcj-1.0.7-cp312-cp312-linux_armv8l.whl
mv pychm/ ~/repos/
mv pychm_c9795e21b032421b888a775cbe2b7cb6/ pychm
mv pydmp_1.py pydmp2.py
mv pyenv/ .pyenv
mv pylyzer ~/.cargo/bin/
mv pymupdf/ ~/repos/
mv pymupdf_e8109b4399a645c485def5a066fb8125/ pymupdf
mv pypackage/ cc-pypackage
mv pypdfium2.py ./tests/
mv pypdfium2.py v2_singlefile.py
mv pypdfium2.py ~/isaac/pkgs/pypdfium2/
mv pyprettier prettierpy
mv pyprettier/ prettierpy
mv pyproject.toml ~
mv pysrt-1.1.2/ pysrt
mv python-arabic-reshaper-2.1.0.tar.xz ../../..
mv python-gui ..
mv python-imports.vim.lua python-imports.vim.spec
mv python-regexbuilder.html ./html/
mv python.json ..
mv python.lua python.orig
mv python.lua python.spec
mv python.spec python.lua
mv python/ scripts
mv python/ ~/projects/
mv python_template_project/ mypkg
mv qyneasxuvz.css bootstrap4.4.1.min.css
mv rainbow-delimiters.nvim-master.zip ~/projects/lua/
mv random_font.py rf.py
mv readme.md ../..
mv remove_gsz.py remove_func.py
mv repos.txt ..
mv repos/*nvim* .
mv req.txt ~
mv requirements.txt ~/req.txt
mv reqz.txt ..
mv reqz.txt 23 34 jaraco
mv rf.py random_font.py
mv rm-wrapper.sh.sh rm-wrapper.sh
mv rmbash.py  cleanhash.py
mv rmc ~/.local/bin/
mv rmc_09_035118 rmc.py
mv rmc_toml.py cleantoml.py
mv rmjs.py cleanjs.py
mv rmjscomments.py rmjs.py
mv robofab_27d1d166bfd249ac8ea8fdf9dafccd71/ robofab
mv rpds_py-2026.6.3-cp312-cp312-linux_armv8l\ \(1\).whl rpds_py-2026.6.3-cp312-cp312-linux_armv8l.whl
mv rst2md.md rst2md.py
mv ruff.lua ruff.spec
mv ruff.spec ruff.lua
mv ruff2.sh wrapper_ruff.sh
mv ruff_rulles make_ruff_rules.py
mv ruik.lua rubik.lua
mv rulesruff1.md ruff_rules.md
mv s.py summarize.py
mv scripts/ ..
mv scripts_1/* ./scripts/
mv serialized_dictionary.json sd
mv serpapi.txt ./isaac/
mv setup.py ..
mv setup.py.in setup.py
mv setup_git.sh ..
mv sh ..
mv shameless url
mv shfmt shfmt_v3.13.1_linux_arm64
mv shiftsrt.py ..
mv showfigfonts showfigfonts.1
mv simsimd.cpython-312.so ./py/
mv site-packages/ 0
mv six_1.py six.py
mv slp.py split_lua_plugins.py
mv soper.txt repos.txt
mv source1.html s1.html
mv sp
mv spec.lua my-plugin.lua
mv spell_checker.py ~/projects/py/
mv split_movies/ series
mv split_multiline.py ..
mv sql/data_sql.json .
mv sqlite3 ..
mv sqlite3 ./bin/
mv stringzilla.cpython-312.so ./py/
mv summarize.py s.py
mv t1.jso t1.json
mv target/wheels/fastwalk-1.4.7-cp312-cp312-linux_armv8l.whl .
mv telescope.spec telescope.lua
mv telescope/init.lua telescope.lua
mv telescope1.lua ../telescope.lua
mv template/ my-plugin
mv template/ nvim-astrovim
mv template_orig orig_template
mv text_summerization.htnl text_summerization.html
mv textaul_nvim/ ./src/
mv textaul_nvim/*.py ./textual_nvim/
mv the-big-book-of-small-python-projects-main/ ..
mv the_best_neovim_configuration_in_the_world___atib_jawad_zion_1.mhtml nvim.mhtml
mv theme-catppuccin.lua mocha.lua
mv themes ..
mv tide ..
mv tide.nvim/ Tide.nvim
mv tide/ ../lua/
mv tide/ Tide.nvim
mv tmp ~/tmp/
mv to.env to.env.py
mv to/env.pyi .
mv tokyo.spec tokyo.lua
mv top22.py top22.sh
mv topics topics.json
mv topics.json topics.md
mv translated_01.srt 01_fa.srt
mv translated_02.srt 02_fa.srt
mv translatefa____01.srt ../fa01.srt
mv transliterated.json t1.jso
mv transliterated.json t2.json
mv tree-sitter-rust-master/ tree-sitter-rust
mv tree-sitter/ tree_sitter
mv tree.py pytree.py
mv tree.txt ..
mv tree.txt ./tests/
mv tree.txt ./tmp/
mv treesitter.lua ..
mv treesitter.lua init.lua
mv treesitter.spec treesitter.lua
mv treesitter/*.lua .
mv ttf/* .
mv ttf/*.ttf .
mv ttf/*.woff2 .
mv turtle\ —\ Turtle\ graphics\ —\ Python\ 3.14.7\ documentation.mhtml turtle.mhtml
mv txt/* .
mv tyde_plugin/ tide
mv ufo.lua ufo.spec
mv ui.lua ui.spec
mv ui/*.lua .
mv uncomment-3.6.0.tar.gz ./tmp/test
mv url ../Download/
mv url scream
mv usage.md ../..
mv usage.py usage.sh
mv util/*.lua .
mv utils_sorted.py utils.py
mv v2.py ..
mv vcuvtruwmt.js a.json
mv vgmhgrmedo.txt ../plugins/
mv vim-fugitive.lua local-plugins.lua
mv vv.py extract_pkg_files.py
mv walker.py ./walker
mv which_key.lua whichkey.lua
mv wjp_city_list.json cities.json
mv woff2 ./font/
mv woff2/* .
mv woff2/* ..
mv woff2/*.woff2 .
mv word_1 ./words/
mv words ~/repos/pwords/
mv words.txt ..
mv words_1  ./words/
mv words_1 w
mv workspace-01a06e00-192e-7bc4-865f-4848232e3d00.zip w.zip
mv worldmap.astc w.ttf
mv wrapper_felo.py feloai.py
mv xorhash.cpython-312.so ./py/
mv youtube\ and\ youtube\ music/ yt
mv yt2txt.sh ..
mv zoxide zuxide
mv zstd.cpython-312.so ./py/
mv zuxide zoxide
mv ~/bin/add_typing.py .
mv ~/bin/sortalias.py .
mv ~/fh.py .
mv ~/install.sh .
mv ~/isaac/may/overflow/nvim-python-config/ .
mv ~/isaac/pkgs/whisper/ .
mv ~/projects/lua/nvim-tree.lua .
mv ~/repos/gemini/template2 .
mv ~/upgrade.txt .
mv ~/which_key.txt .
mv چارگون\ -\ مدیریت\ یکپارچه\ فرآیندهای\ سازمانی.mhtml chargoon.mhtml
mvl 1.md 74 145 pdfview.html
mvl 13.py 24 25 13_1.sh
mvl 14.py 12 12 14_1.sh
mvl 3.lua 3 257 options.lua 
mvl METADATA  11 28 req.txt
mvl ans.md 25 41 lsp.lua
mvl ans.md 31 41 ufo.lua
mvl cf2mp4.py 372 554 aaa.py
mvl dap.lua 29 53 dap-python.lua
mvl en.json 2 28564 uper.json
mvl felo.txt 1 18 git.lua
mvl felo.txt 1 19 lazy.lua
mvl felo.txt 1 21 treesitter.lua
mvl felo.txt 1 22 autocmds.lua
mvl felo.txt 1 29 keymaps.lua
mvl felo.txt 1 39 neotest.lua
mvl felo.txt 1 40 telescope.lua
mvl felo.txt 1 41 python.lua
mvl felo.txt 1 48 ui.lua
mvl felo.txt 1 49 readme.md
mvl felo.txt 1 50 debug.lua
mvl felo.txt 1 73 completion.lua
mvl felo.txt 1 94 lsp.lua
mvl felo.txt 4 33 options.lua
mvl felo.txt 47 50 nvim/init.lua
mvl indent-blankline.lua 18 26 init.lua
mvl init.lua 1 14 formatting.lua
mvl init.lua 1 20 blink-cmp.lua
mvl init.lua 1 45 python.lua
mvl jobutils.py 290 359 pool_helper.py
mvl lsp-dap.lua 131 183 dap.lua
mvl lsp.lua 32 40 mason-lspconfig.lua
mvl lsp.lua 43 54 conform.lua
mvl lsp.lua 47 114 ruff.lua
mvl movies.txt 5650 5659 url
mvl my.lua 1 1110 keymaps.lua
mvl my.lua 1 129 opt.lua
mvl my.lua 1 180 files.lua
mvl my.lua 1 242 autocommands.lua
mvl my.lua 1 311 commands.lua
mvl my.lua 1 449 util.lua
mvl options.lua 1 120 k.lua
mvl options.lua 510 593 3.lua 
mvl out1.lua 3 137 options.lua
mvl out2.lua 3 257 options.lua 
mvl readme.md 22 39 tree.txt
mvl req.txt 1 10 hh
mvl reqz.txt 23 34 jaraco
mvl write_a_python_script_to_detect_pkg_reso.txt 1 77 fix_pkgre.py
mx
myip
n  Cargo.toml
n  abbr.txt
n  pyproject.toml
n  zstder.py
n ../../init.lua
n ../bashbin/blk
n ../blink.lua
n ../config/keymaps.lua
n ../config/keymaps.lua 
n ../config/lazy.lua
n .ba
n .bash_history
n .bashrc
n .busted
n .coverage
n .dns
n .env
n .felo_token
n .flake8
n .flake8_1
n .git/config
n .git/config 
n .github_token
n .github_token 
n .gitignore
n .gitignore 
n .gitignore.sh 
n .gitmodules
n .glm5_token
n .lazy.lua
n .ls_colors 
n .myinfo
n .neoconf.json
n .openai_token 
n .openrouter_token
n .personal_dict
n .pre-commit-config.yaml
n .prettierrc
n .pylintrc
n .stylua.toml
n .typos.toml
n 00
n 000.json
n 000.txt
n 001.json
n 001.sh 
n 001.txt
n 002.mhtml
n 002.sh 
n 002.txt
n 002_recovered.html
n 003.mhtml
n 003.sh 
n 004.sh 
n 005.sh 
n 006.sh 
n 006bc5af5fc2c52.css
n 007.sh 
n 008.sh 
n 009.sh 
n 010.sh 
n 011.sh 
n 011_extracted.py 
n 02.json
n 02.mhtml
n 021.sh 
n 027
n 028
n 038.sh 
n 042
n 043
n 043.sh 
n 05.sh 
n 06.sh 
n 06.srt
n 06.srt -p 15
n 07.sh 
n 08.sh 
n 09.sh 
n 0b14368374d2b4b.js
n 1.html
n 1.lua 
n 1.md
n 1.md 
n 1.mhtml
n 1.txt
n 10.py 
n 10.sh 
n 11.sh 
n 11489.txt
n 11_008.py
n 12.py 
n 12.sh 
n 13.py 
n 13.sh 
n 13_1.sh 
n 14.py 
n 14.sh 
n 14_1.sh 
n 15162e377c95bc5.js
n 19_45
n 1_fa.txt
n 2.html
n 2.lua 
n 2.txt
n 20most
n 223
n 2e253cb1550dda3.js
n 2to3
n 2to3-3.12
n 2to313
n 3.lua 
n 3.txt
n 30
n 30b998696efcb1d.css
n 30b998696efcb1d.css 
n 4
n 4.txt
n 40_68
n 40_99.py
n 41b9a0c57802f01.js
n 4388
n 5.srt
n 56332e453a9156a.js
n 6
n 60bdfd7e751a56c8.txt 
n 6_87.lua
n 7z
n 820319a78e8bf75.js
n 9d91429a3615342.javascript
n 9d91429a3615342.js
n Cargo.toml
n Cargo.toml 
n Folke.html
n HASH_AVAILABLE.py
n HASH_AVAILABLE_1.py
n HOME.lua
n Image.md
n Jamfile
n Jamfile-engine
n MANIFEST.in
n METADATA
n METADATA 
n Makefile
n Midsomer\ murders\ s19e06-da.srt 
n PKG-INFO
n PU02.sql 
n Qt6Xml.pc
n README
n README.md
n README.md 
n README.rst
n README.rst 
n README.txt
n RECORD
n SpaceVim.html
n StartMason.html
n TH18_Bases_20260807_0220.html
n Taboo.S01E03.480p.Farsi.Dubbed.D1.DonyayeSerial.srt
n Taboo.S01E03.480p.Farsi.Dubbed.D1.DonyayeSerial.sub0.per.srt
n Taboo.S01E06.480p.Farsi.Dubbed.D1.DonyayeSerial.srt
n Taboo.S01E06.480p.Farsi.Dubbed.D1.DonyayeSerial.sub0.per.srt
n Taboo.UK.S01E01.1080p.BluRay.x264-SHORTBREHD.en-en.srt
n _3_adjust.py
n __9.py 
n __about__.py
n __init__.py
n __init__.py 
n __init__.pyi
n __main__.py
n __main__.py 
n _brew
n _c
n _config.yml
n _core.py
n _crossinterp.py
n _generated.lua
n _git-rm
n _library_scope.py
n _pkg_resources.py
n _pydoc.css
n _queues.py
n _utils.py
n _version.py
n _version.pyi
n a
n a.css
n a.json
n a.py 
n aaa.py 
n ab
n abb1.json
n abbr.json
n abbr.txt
n abbr_1.txt
n abbr_fa.txt
n abbreviations.json
n add.wasm
n add2gitignore.py
n add_typing
n add_typing.py
n addcomma.py
n adding-in-soon.md
n addmain
n addtype.py
n admin.py
n aff.py
n afk
n afk.py
n afkco.py
n agents.txt
n aliases.json 
n aligned_indent.py
n all
n all.dict
n all.json
n all.snippets
n all1 
n all_fa
n all_fa.json
n all_strings.txt 
n allinone.lua
n alpha-nvim.lua
n alpha-nvim.lua 
n analyze-build
n analyze.py
n animation.css 
n annot.html
n ans.md
n ans.md 
n answer_g4f.md
n aokgggefcs.css 
n ap8
n apk_font_extractor
n apk_font_extractor.py 
n apm.py
n appdirs.py
n append_ty
n appender
n appender.py 
n appendr
n appendr_20260819_185529.py
n appendt
n appwndr
n ar_extract
n ar_extract.py 
n archive.d
n archiveutils.py 
n aremc
n aremci
n armc
n armc.py
n arrow_image.json 
n ascan.py
n ascan2.py
n aspell.md
n ast.py
n asteval
n asteval.py
n august/autofix_typo_learner.py
n august/brmc0810_171545.py
n august/fixext_19_190312.py
n august/fixext_45.py
n august/rmc_17_194307.py
n auto_comp
n auto_enhance
n auto_git_fmt.py
n autoclone
n autocmd.lua
n autocmds.lua
n autocmds.lua 
n autoco
n autoco.py
n autocomp
n autofix_typo
n autofix_typo_learner.py
n autopep8.py
n autorip.py
n autotrans
n avante.lua
n awesome-neovim/README.md
n b
n b01.json 
n b1.lua 
n backend_imports.py
n ballers.720
n base.py
n bases.py
n bash.lua
n bash.md
n bash2py.py 
n bat2bash
n batch_1.txt 
n bb.json
n bb.tx
n bb.txt
n bbb.py 
n bbc
n bench.py
n bench.py 
n bench_mp.py 
n bench_tracer.py 
n benchmark.py
n best_ai_tools_in_germany_2025___aiting_ai_1.html
n bestwhois
n big.json
n bin.mjs
n bin/deepbinlist
n bin/extz
n bin/fztrans
n binaryornot
n binding.gyp
n binortxt
n blink
n blink-cmp.lua
n blink-cmp.lua 
n blink.lua
n blink.py
n blk
n bnn
n bootstrap4.4.1.min.css 
n br.py
n brmc
n brmc.py
n brmc.py 
n buf_utils.vim
n buff.huff
n buffering.py
n build-requirements.txt
n build.py
n build.sh
n build.sh 
n build_1.sh 
n build_cffi.py
n build_env.py
n build_rust.py 
n build_single_page
n build_single_page.py
n builder.sh
n building_with_meson.md
n c0.sh 
n c005.json
n c1.sh 
n c10.sh 
n c2.lua 
n c240.conf
n c240.json
n c2f.py
n c4u
n c4u.py
n c7880d6cb2df218.js
n calculator.dc27245d.css
n cargo 
n cargo.toml 
n cargo2.toml 
n cargo_publish.sh
n cars.txt
n certs.py
n cext.py 
n cf
n cf2mp.py 
n cf2mp3.py 
n cf2mp4
n cf2mp4 --write .
n cf2mp4.py 
n cforyou
n cforyou.py
n ch01_summary.txt
n charcount
n chargon_-_mdirit_ikparchh_fraٓindhai_sazmany.html
n chargoon.html
n chat.lua
n chdvywghqd.css
n cheat.dat
n check4update
n check4update.py
n check_dups.py
n check_missing.py
n check_rmc.py
n checkspell
n chk_imports
n chm.dict
n chm_lib.c
n chmodi
n chunk-vue.511f9133.css
n ci-install.sh
n cid2code_Adobe_GB1.txt
n circle_wheels.py
n clang.lua
n class_diagram.py
n class_diagram_en.py
n class_duplicates.json
n classes.txt 
n claude.sh
n clean_bash
n clean_gitlinks.py
n clean_html.py
n clean_json.py 
n clean_lua
n clean_names
n clean_py
n clean_record
n clean_record.py
n clean_subs
n cleanccpp
n cleanccpp.py 
n cleancss2
n cleaned.json
n cleaned.sh 
n cleanerts
n cleanerts.py 
n cleanhash.py
n cleanjs
n cleanup_darwin
n cleanvim
n cli.js
n cli.py
n cli.py 
n client.py 
n cma_city_list.json 
n cma_map_list.json 
n cmapdb.py
n cmk
n cmkk
n cnn
n code_runner.lua
n code_snip_extractor
n codeium.orig
n colab15mb
n coldstart.json 
n collect_cmake.py
n color.lua
n colorfulmenu.lua
n colorscheme.lua
n command.lua
n command_line.py
n commands.lua
n commands.py
n commands.sh 
n comment.lua 
n commentout
n commentout.py
n comments.lua
n common.py
n common_lsp.lua
n comparablemixin.py
n compat.py
n compile_previse
n compile_previse.md
n completion.lua
n compression_benchmark.py
n compsub
n conf.py
n config.json
n config.json '
n config.lua
n config.yaml
n conform.lua
n conform.lua 
n const.py
n const.py 
n constants.py
n constraints.txt
n consts.py
n context.py
n control
n conv_cmap.py
n conversation.txt
n conversation_rmc.md
n convert2to3.py 
n convert_regex.py 
n convert_to_dic.py
n cookiecutter.json
n copilot.lua
n copy_pkg_files.py
n core.lua
n core.py
n coreutils.postinst
n coverage.json
n cpp.snippets
n cprint.py
n cpwhl.sh
n crawl_movie_site
n crawl_movie_site.py
n crawler
n create_monthly_branch.py
n create_monthly_branch.sh
n create_setup
n create_setup.py
n create_stub
n create_symlink
n create_symlink.py
n create_symlink.py 
n cspell.config.yaml 
n cspell.lua
n css_template_1.py
n cstrmc
n csubdirxz
n csubdirxz.py
n curl_req.sh
n curzsiacuf.js 
n custom-autocmd.lua
n custom.css 
n custom_fixer.md
n cutoff2024
n cv_deps
n cxxgen.py
n cytonizer
n dap-python.lua
n dap.lua
n dap.lua 
n data.json
n data.sqlite.json
n data_sql.json
n data_sql_0.json
n data_sql_1.json
n ddbbdaf44390745.js
n ddd.cpp
n ddd2.cpp
n ddup_bash_functions
n dduputil__Extracted.py
n dead_code.sh 
n debug.lua
n debugpy
n debugpy-adapter
n deduper
n deepack
n deepbinlist
n deepseek.lua
n deepseek.md 
n deepseek_bash_20260907_fb4ffe.sh 
n default_config.lua
n defaultrulesruff1.md 
n defaults.lua
n delemp
n delempco
n delim.lua
n delshort
n depend
n detect_multilune_text.py
n detect_multilune_text.py -a
n detect_orphan_files.py
n detect_pkgresources
n detect_pkgresources.py
n detect_unused.py
n dh_reverse
n dh_usage.txt 
n diagnostics.spec 
n dic.json
n dic.py
n dic0.json
n dic2.json
n dic3.json
n dic_en.json
n dic_en_fa.json
n dic_fa.json
n dic_fa_en.json
n dickens 
n dictionary.json
n dictionary.txt
n diduper
n diff_report.json
n dir
n dirb.py
n dirb2.py
n dirquery.json 
n disable_lua_ls.lua
n distro.py
n dj
n dlsbfsupcu.js
n do.py
n doc-debtags 
n doc.py
n docgen.lua
n docgen.sh
n doclin
n document_group_item.py
n dos2unix.md 
n dosbox-black.vim 
n downloader.py
n dsa_page.md 
n dufpy
n dup_detector
n dupwaste
n dupwaste.py 
n dutree.py 
n eco.vim
n edge.lua
n embed_optimizer
n emoji_list.lua
n empty_template_setup.py
n en.json
n en.utf-8.add
n en_fa.txt
n en_freq.json
n enfa.json
n enfa_failed.json
n english_postSub.db 
n entry_points.txt
n env.lua
n env.pyi
n epizsgpbks.css 
n erap
n erap.py
n errors.json
n errors.txt
n errors.txt 
n esbuild
n esbuild.wasm
n eslint.lua
n europarl.test
n ex_abbr.py
n ex_abbr.py py ex_abbr.py abbr.txt
n ex_com.py
n ex_tar
n exact_duplicates.json
n example.lua
n example.py
n example_init.lua
n example_usage.py
n excolors
n excolors2
n excst
n eximports
n exlinks
n exnames
n exsub
n ext.bundle
n ext.c
n ext.h
n ext.o
n extcst.py 
n external.txt
n extra.css
n extract_bash_functions
n extract_bash_functions2
n extract_embedded_elements
n extract_lines_contains_base64
n extract_py_code.py y
n exts
n extz
n f
n f24.py 
n f2base64
n f2c
n f2c.py 
n f_fa
n fa-IR.dic
n fa.json
n fa.py
n fa.txt
n fa_4_en.json
n fa_failed.json
n faen
n faen.json
n faen_dic.json
n fail.txt
n faild.json
n failed-en.txt
n failed-en_fa.txt
n failed.txt
n failed_fa.txt
n fanar.html
n fastwalk/__init__.py
n fat.py
n fb-fa
n fb64.py
n fc1
n fcl
n feat_1.bin 
n feed.json
n felo.ai
n felo.txt
n felo_20260824_164511_666.txt
n felo_20260824_170901_610.txt
n felo_20260828_120324_695.txt
n felo_commands.txt
n felo_thonny.html
n feloai
n fh.py
n fh8.py
n figlist
n file.py
n file_urls.txt
n filecheck.1.md
n filecompressor.py
n filehandler.py
n filehasher.py
n filehasher_1.py
n fileintegrity.py
n filesystem.py
n filetype.vim
n filetypes.lua
n fileutils.py
n fileutils.py 
n fileutils.pyi
n fileutils_cover.py
n fileutils_sorted.py
n filevalidator.py
n filterlines.py
n final_fa.json
n find_elf
n find_missing_imports.py 
n find_non_eng
n find_scripts
n find_vcredist.py
n findpdflinks
n findsn.sh 
n fix_bash_shebang
n fix_escape
n fix_escape.py
n fix_regex_escape
n fix_ws
n fixdup.py
n fixescape.py 
n fixext
n fixext.py
n fixextco
n fixextco.py 
n fixre__StringInfo.py
n fixshebang
n flake8_docstrings.py
n flakeheaven-source.txt
n fmt_bash
n fname_recommender
n folderhasher.py
n folderhasher_1.py
n folderize_plugins.py
n foldesiz
n foldesize
n foldext
n foldsize
n folke.txt
n fontconverter
n fontconverter.py
n fontlabFeatureSplitter.py
n fontpre
n formatter.lua
n formatting.lua 
n fp.html
n free.html 
n free.md 
n frmc
n front.html
n fs.py
n fsim.py
n fslint
n fslver
n fswalker_report4generator.py
n fswalker_report_gen.py
n fswalker_report_gen.pyi
n function/usage.py 
n function_duplicates.json
n functions.txt 
n furls
n furls.py
n fv.pyi
n fztrans
n gcli.py
n gemini-code-1784300579647.py
n gemini.css
n gemini.md
n general.vim 
n generate.py
n generate_config_docs.py
n generate_init
n genperf.py
n gensim_based.py
n gentags.py
n get_available_algorithms.py
n getrepos
n gext.py
n gextco2
n gf
n gfast.py
n gfixre
n ghpy
n ghpy.txt
n ghpy10
n ghpy10.sh
n ginit.vim
n girl_from_plainville
n git-config.md
n git-wtf.rb
n git.lua
n git_differ
n gitconfig.local.symlink.example
n gitdif
n githelper.py
n github.txt 
n github_14
n github_dark_dimmed.lua
n gitlinks.txt
n gitsub.sh 
n glm5.py
n glmchat.py
n globals.lua
n gmp.info-1
n gp
n gp.py 
n gp2
n gptagqrnmk.css
n grapgql_plugin.py
n grep.vim
n grep.vim 
n grmc.py
n gvimrc.symlink
n gyp
n gzip.lua
n h
n hasdoc
n hasdoc.py 
n havebin
n head.tex
n header.py
n headers.lua
n health.log
n health.lua
n healthcheck.txt
n hejri.py
n help.lua
n helpers.py 
n hermes.sh
n hex.lua 
n hh
n highlights.lua
n hijri
n hijri.py
n hj
n hmin
n hmin.py
n hmin.py 
n home.md
n html.py
n html.vim
n html_entity
n html_minify_py
n html_to_md
n http.lua 
n httpx
n hunspell.hxx
n hunspell.txt
n hunspell_1.txt
n hunspell_dic.json
n hunspell_enfa.json
n hyph_en_US.dic 
n ibl.lua
n ibl.lua 
n ibl.spec
n idna
n if_pyth.txt
n ignore.github
n img2txt
n imgviewer
n import_collector
n imports
n imports.py
n imports.py 
n in.html 
n indent-blankline.lua
n indent-blankline.lua 
n indent-blankline.spec
n indent-blankline_1.lua
n indentblankline.lua
n indents.scm
n index.cjs
n index.html
n index.html 
n index.js
n index.py.j2
n index.rst 
n index_11.html
n index_16.html
n index_36.html
n index_5.html 
n info2md.py 
n init.coffee
n init.lua
n init.lua 
n init.vim
n init.vim 
n init2.lua
n init_1.lua
n init_project
n initapm.sh
n initproj
n inline_assets.py
n insert_skipdirs
n insert_skipdirs2
n inside-init.lua
n install.py
n install.sh
n install_libzmq.sh
n install_nvim.sh
n install_python_tools.sh
n install_rust.sh
n installed
n installer.md 
n internal.txt
n ionosphere.mat
n ipybridge.lua
n isb1.py
n isbinary.py
n isbinary.py 
n iso3166-2.mo
n isort
n jap_en.txt
n javascript.json
n job_utils.py
n jobutils.py
n jobutils.py 
n jp.py
n jpegsize.sh 
n jpo
n jpo.py
n jpserver-15640-open.html
n jscssminer
n json.lua
n json/__init__.py
n jump.sh
n jwesgitlpx.css
n k.lua 
n key-maps.md
n keymaps.lua
n keymaps.lua 
n keymaps.lua delemp
n keymaps.md
n kickstart-python.lua
n kite.vim
n klv
n ksc5601_hanja.json 
n l
n la
n lang.lua
n langdet.py
n langquery_2.json 
n lastncommits
n lazy-lock.json
n lazy-lock.json 
n lazy-setup.lua
n lazy.lua
n lazy1.orig
n lazy2.orig
n lazy3.orig
n lazy_setup.lua
n lazy_snapshot.lua
n lazyconfig.html
n lazyman.sh
n lazysync
n lazyvim.json
n lazyvim.json 
n lens_entrance_animation.json 
n less.bat
n less.sh
n less_than5
n lezcfcpetb.js
n lib.rs
n libchm.py
n lic
n link1
n links
n linux-mac.sh
n linux.py
n list_files_starting_with.py
n ll
n local-plugins.lua
n localplugins.lua
n localplugins.lua 
n localthemes.lua
n lockfile.json
n log-autocmds.vim
n log.py
n log.txt
n loname
n ls
n ls2
n lsp-2.lua
n lsp-dap.lua
n lsp.log
n lsp.lua
n lsp.lua 
n lsp.txt 
n lsp.vim
n lsp_conf.lua
n lsp_folded.log
n lsp_utils.lua
n lspconfig.lua
n lss
n lt
n lua-language-server
n lua.json
n lua.lua
n lua.snippets
n lua/config/autocmds.lua
n lua/config/keymaps.lua
n lua/config/lazy.lua
n lua/config/options.lua
n lua/config/options.lua 
n lua/config/snacks.lua
n lua/plugin_specs.lua
n lua/plugins/lsp.lua
n lua/plugins/telescope.lua
n lua/tokyonight/config.lua
n lua_ls.lua
n lualine-2.lua
n lualine.lua
n lualine.spec
n luasnip.lua
n lunar_newyear_merchbanner.json 
n lzma-history.txt
n lzma.py
n lzmamter.py 
n lzr.py 
n m4a2mp3.py 
n magickcv.py 
n magivkcv.py
n main.4af4bdda.min.css
n main.py
n main_85.py 
n makefile
n mame_1
n man_doc
n managers.py
n mapping.vim
n mappings.lua
n maps.lua
n markdeep.html
n markdown.css
n markdown.css.html
n markdown.lua 
n markdown.py
n markdown_opener.html
n markdown_viewer.html
n mason-lspconfig.lua
n mason-lspconfig.lua 
n mason-lspconfig2.lua
n mason-lspconfig_1.lua
n mason-receipt.json
n mason.lua
n mason.lua 
n mason.spec
n mason_guide.md
n match.py
n matchup.lua
n material.lua 
n matur
n matur2
n mc.ext.ini
n md.css
n md2pdf
n md5sum_approx
n md_viewer_tother.html
n mdhl.css
n mdview
n mdview.py
n mdview_simple
n mdviewer
n mdviewer.html
n mendic
n merge_enfa
n merge_enfa.py
n merge_faen.py
n merge_hardlinks
n merge_pdf.py
n merge_pkg
n merged0.css 
n merger
n mess
n meta.sh
n metadata.json 
n mfadic
n mhtml-to-html
n migrate_cf2mp.py
n mini.sh
n minify.js
n mirror.py
n misc_fa.json
n missing.txt
n missing_files.json
n misspelled.txt
n mjetdhdmer.txt 
n mk_deptree_svg
n mk_screenshot.py
n mk_setup
n mk_stand
n mk_stand2.py
n mk_stanf
n mkc
n mkpic
n mkstand
n mkstand.py
n mkswap.save
n mktree
n mktree.py
n mkx
n mkx.py
n mldonblwgf.txt
n mocha.lua
n module_docs.py
n module_usage_with_charts__save_charts.py
n molten.lua
n momfxulrpa.js
n monkeytype.sqlite3
n move_gitlinks
n move_tests_dirs
n move_tests_dirs.py
n movebin
n movies.txt
n mozilla
n mpbench.py
n muffin.m2a 
n my-lazy-neovim-config-3h6o.md
n my-lazy-neovim-config-3h6o.md 
n my-plugin.lua
n my.lua 
n myip
n mypy-requirements.txt
n n297.json
n name_boy.json
n names.json 
n native.js
n nci
n neo-tree.lua
n neo-tree.nvim.log
n neo_dap.lua
n neotest.lua
n neotree.lua
n neotree.spec
n new2old
n new2old.py
n newrepo.py 
n newrepo_17_135843.py
n newrepo_20260730_071952.py
n newtab
n nionfziiin.js 
n nmost_repeated_words
n nndihkwtrb.css
n no_ruff.lua
n node2.json
n node5.json
n node6.conf
n node6.json
n noface.py
n noisedict_3 
n nokia.pem
n nolua
n nolua.py
n noneng
n normalize_fa.py
n noroot
n nul-ls.lua
n null-ls.spec
n numba
n nvchad.lua
n nvchad.lua 
n nvenv.sh
n nvim-cmp.lua
n nvim-dap.lua
n nvim-lazyman/lua/ecovim/internal/blame.lua
n nvim-lazyman/lua/free/autocmds.lua
n nvim-lazyman/lua/free/extras/pde/hydra.lua
n nvim-lazyman/lua/onno/autocmds.lua
n nvim-lsp-config.lua
n nvim-lsp-config.lua.orig
n nvim-music-player/
n nvim-tree.lua
n nvim-treesitter.lua
n nvim.html
n nvim.log
n nvim.txt
n nvim_lsp.lua
n nvim_messages.txt 
n nvim_resources.md
n nvim_setup_linux.sh
n objectsFL.py
n octohub.lua
n old.orig
n oldest_files
n oldpi
n ollama.sh
n optimizer.py
n options.lua
n options.lua 
n options2.lua
n optipng.html
n optwin.lua
n os2
n os2p
n os2p.py 
n osdb 
n otf2woff2.py
n out
n out.lua 
n out1.lua 
n out2.lua 
n outer_banks
n output.html
n output.json
n overrides.lua
n p.json
n package-lock.json
n package.json
n packages.json 
n packages.txt
n packer_compiled.vim
n page_0571.txt
n page_0825.txt
n palette.06af60db.min.css
n parsers.lua
n parsers.py 
n paste.lua
n paste.vim
n pathquery.json 
n pattern_matching.py
n pd2u
n pdate.html
n pdf.min.js
n pdf.worker.min.js
n pdf2txt.py
n pdf_open.html
n pdfdocument.py
n pdfdocument_20260817_222750.py
n pdfdocument_20260902_090116.py
n pdmp
n pep621.py
n perpage2
n perpage_20260816_142037.py
n perplex1.md
n persian.json
n persian_date.html
n persiandate.html
n petal.lua
n pfzf
n pip
n pip.conf
n pip.conf.orig
n pip.txt
n pip2
n pip2.txt
n pip3
n pip3.12
n pipget
n piprm
n pipwhl
n pipwhl.py
n pkg_resources_reporter_autofixer.py
n plistlib.py
n plugin.lua
n plugin_specs.lua
n plugins.lua
n plugins.md
n plugins.vim
n plugins/
n plugins_1.lua
n pngq
n pnr
n poetry-installer-error-eo28rfy3.log
n poetry.py
n pool.py
n pool_helper.py 
n port_forward.py
n postinst
n pp_pdfminer
n pp_pdfminer.py
n pp_pdfminer.py 
n pp_pdfminer2.py
n pp_pypdf2.py 
n ppminer.py
n precise.css
n precise.md
n prereqs.sh
n prerm
n presence.vim
n prettier
n preview_fonts.html
n prg
n process.py
n project_bootstrap.lua
n prompt.txt 
n proof.py
n property_contexts
n protobuf.list
n providers.html
n province.json
n proxy_tester
n pu
n pu02_1.sql 
n pu02_1_regexes.py 
n pure.txt 
n purenotpure
n purepy
n puter.html
n pwd.lst
n pwn
n py-compile
n py.cleanup
n py.txt
n py.typed 
n py/logging.py 
n py/xmlbuilder.py 
n py3compile
n py_compile.py
n py_dev.py
n py_mini_racer.py
n py_regex_builder.html
n pyco
n pycodex
n pycommon
n pycp
n pycp.py
n pydiff
n pydirb.py
n pydoc
n pydoc3.12
n pydocr
n pyeza
n pygdu
n pyls.lua
n pymagic.py
n pyminify.py
n pyncdu.py 
n pynet__test_speed.py
n pyng_20260823_221129.py
n pypi.html
n pyprettier
n pyproj.py
n pyproj2
n pyproject
n pyproject.toml
n pyproject.toml 
n pyproject_1.toml 
n pyrefly.lua
n pyrg
n pyrg.py
n pyright
n pyright.lua
n pyright.lua 
n pyrun
n pysanity-check
n pysplit
n pysrt/compat.py
n pysrt/srtfile.py
n pystone.py
n pysvg
n pytest.ini
n pytest.py
n python-3.12.pc
n python-imports.vim.lua 
n python.json
n python.lua
n python.lua 
n python.orig
n python.pc
n python.py
n python.snippets
n python.spec
n pythonShellcode.py
n python_concurrency_with_asyncio_matthew_fowler.pdf.html
n python_concurrency_with_asyncio_matthew_fowler_1.pdf.html
n pythons_pre-declared_constants_are_kinda_weird.html
n pytokei
n pytokei2
n pytrans
n pytree
n q1
n q1.md
n q10
n q13
n q14
n q15
n q16
n q19
n q2
n q20
n q21
n q22
n q23
n q29
n q3
n q30
n q31
n q66
n q9
n qbin.net 
n qq
n quick_folder_hash.py
n quick_hash.py
n quotes.json
n qv
n qylxdbarkr.js 
n qyneasxuvz.css 
n rainbow-delimiters.lua
n random_font
n random_font.py
n ranking.html
n rbenv
n rbenv-download
n readme.md
n readme.md 
n recommended.sh
n redis.conf
n refactai.lua
n refactor_proj
n refactor_utils.html
n registry.json 
n reinstaller.py
n reinstaller.py 
n remove.sh
n remove_func
n remove_gsz
n remove_gsz.py
n remove_header.py
n remove_lines_containing_str_from_files
n rename.py
n rename_html_by_title
n rename_html_by_title.log 
n rename_html_by_title.py
n rename_html_by_title.py 
n rename_html_by_title2
n rename_html_by_title2.py
n render.py
n repeat.vim
n repo.json
n repo1.txt
n report.sh
n report.txt
n repos.txt
n req
n req.txt
n req.txt 
n requests.html
n requirements-dev.txt 
n requirements.txt
n requirements.txt 
n reqz.txt 
n res
n resize.vim
n resolv.conf 
n resolver.py
n restore_all_historical_deletions
n restore_historical_deletion.py
n revdic
n revdic.py
n reverse_inline
n rfr
n rfs
n rm_bash
n rm_c_cpp
n rm_comments.py 
n rm_lines_that_contains
n rm_moduledoc
n rm_moduledoc.py 
n rm_skipdirs
n rm_skipdirs.py
n rmbash
n rmc
n rmc.py
n rmc.py 
n rmc.spec
n rmc2.py 
n rmc_09_035118
n rmc_20260819_120558.py
n rmc_toml
n rmco
n rmcpp
n rmcst
n rmdoc_cpp
n rme
n rme.py
n rme.sh
n rmi
n rmjs
n rmjsts
n rmlic
n rmlua
n rmmc
n rpk.py
n rplugin.vim
n rprompt
n rrw
n rs_main.rs
n rst2md.md
n rubik.lua
n ruf
n ruff.lua
n ruff.lua 
n ruff.toml 
n ruff2
n ruff_rulles 
n ruimg
n rulesruff1.md
n rulesruff1.md 
n run-tests.sh
n run_parallel.py
n run_parallel.pyi
n run_pylint
n run_util.py 
n runpy
n rustwalk/__init__.py
n rvwmmxopcs.css
n s
n s.py
n s1.html
n sample-cli-config-file.conf
n sanity1.py
n sansorvideo
n scrape_web.py
n scrape_web_en.py
n scratch.lua
n script
n script_1
n sd
n search.c
n search.py
n sed1.sh 
n selection_mode.py
n serialized_dictionary.json
n serialized_dictionary.pkl
n service-worker-5380a67e8456c89c.js
n set_dns
n settings.lua
n settings.vim
n setup.cfg
n setup.cfg'
n setup.py
n setup.py 
n setup_git.sh 
n setuptools.py
n sgqiomszli.txt 
n shallow_clone.orig
n shallow_clone.skel
n shameless
n shiftsrt
n show_filelist.py
n show_ip
n show_tree.py
n shrinkpdf
n similar_size_files
n simz.json
n six.py
n slugnet
n smart_archiver.py 
n snacks.lua
n snacks.lua 
n snacks.nvim.cloning
n snapper
n snappy.pyi 
n snippets.lua
n snippets.snippets
n snippets.vim
n socket-worker-21543511f70ae97b.js
n somePython.py
n sonic
n sonic0813_155410.py
n soniq
n soniq2.py 
n soper.txt
n sort_alias_by_values
n sort_pyfile
n sortbylen.py
n sorted_words.json
n source5.html
n soverify
n spdf
n spdf2
n spec.lua 
n specs.lua
n speedtest.py
n spell.lua
n spell_checker.py
n spell_checker.py 
n spell_checker__JSONHandler.py
n spell_checker__MisspellingFinder.py
n spell_corrector.py
n spell_fnames.py
n spellcheck
n spellcheck.py 
n speller.py
n split_lua_plugins
n split_lua_plugins.py
n split_multiline.py 
n split_pdf_by_page
n splitfile.py
n spring_deps.lua
n sqlite2json
n sqlite2json2.py 
n src/lib.rs
n srisvctbpr.js 
n srtexc.py
n srtfile.py
n srtitem.py
n srtshift
n srttime.py
n standalone_css
n startup.txt 
n status
n stop_auto_install_ruff.lua
n strep
n strict_filter_noneng
n stringr
n strip_comments
n strip_html_tags.py 
n strip_installed_pkgs.py
n strip_installed_pkgs.py 
n stripe_mobile_sdk_ece_bridge_1.html
n strxor.c 
n stubgen.py
n stylua.toml
n subl
n substitute.lua
n suits
n summa
n sunik.py 
n svgo.py
n symdups
n sync-wiki.sh
n t.py
n t.py 
n t.pyi
n t1.json
n t1.txt
n t2.json
n t5
n t5.py
n taboo
n tags
n tandalone.py
n target-spec-json-schema.json 
n tbl_signature.json 
n tcg
n tcs2
n telescope-2.lua
n telescope.lua
n telescope.spec
n telescope1.lua
n telescope_1.lua
n telethon0.py
n telethon1.py
n telethon2.py
n tell_font_name
n template
n template.py
n template.yml.url
n template2
n teneriffa.gpx
n termimg.py
n test.py 
n test1.py
n test2.py
n test_1.py 
n test_func_inspect_special_encoding.py
n test_get_files.py
n test_hunspell.py
n test_model_service.py
n test_mp.py
n test_wheel.py
n tests/__init__.py
n text.snippets
n textobjects.scm
n textutils.py
n tgzr.py 
n th1.md
n the.old.man.txt
n the.staircase.txt
n theme_picker.lua
n think1.md
n thonny.html
n thought.md
n tide.lua
n tmpy
n tnn
n to.env
n to_jpg
n to_png
n tofa.py
n toggleterm.lua
n tojson
n tokyo.lua
n tool.py
n tools.py
n top11
n top22.py 
n top500
n top501
n topics
n topics.json
n topics.py
n tore
n tosc
n toutf8
n trafila
n trans_py.py
n transliterated.json
n transrt.py
n tree
n tree.py 
n tree.txt
n treesitter-2.lua
n treesitter.lua
n treesitter.spec
n treesitter_1.lua
n trend_py10.txt
n try.sh
n tscleaner
n tsdeduper
n tsext
n tsext.py
n tt
n tue18aug0111.log
n turtle.html
n twilight.lua
n txt2wav
n txt_ext
n txtext
n ty.lua
n typescript
n u7z
n ubbdlxuaka.css 
n ubuntu.sh
n udiffer
n uesvtayluw.txt
n ufa.py
n ufo.spec
n ugl
n ui.lua
n ultisnips
n unix.py
n unparse.py
n untarxz.py 
n up051.sh 
n update_readme.py
n update_record.py
n uper.json
n upgrade.txt 
n upimg
n upkl
n upkl.py
n url
n url_downloader.py 
n urlchecker.py
n urls
n urls.py
n urls.txt
n urlzz
n urlzz.txt
n usage.md
n usage.py
n user_settings.lua
n util.lua
n util.py
n utils.lua
n utils.py
n utils.py 
n utils.vim
n utils_sorted.py
n utils_sorted.py 
n uumefykjuh.lua
n uv
n uv/_core.py
n uzz
n uzz.py 
n v1.html 
n v1.py
n v2.py
n v22.py
n v4.py 
n validate_binary_extensions
n vast_controls.md 
n vcuvtruwmt.js
n vddup
n vddup2
n vendored.py 
n venv2spkg.py
n verbs.txt
n version_1.json 
n vim-fugitive.lua
n vimbits.vim
n vimlparser.py
n vimrc.symlink
n vimspector.json
n violations.py
n vista.lua 
n vs_env.py
n vulture
n w
n w16
n w2
n w_1
n w_1_fa.json
n w_3_fa.json
n walkdir.py
n walker.py
n warn-rmc.txt
n wdev.py
n webpipe.py 
n webster 
n wget.info
n wget.md
n wheel_summary.py
n which-key.lua
n which-key.lua 
n which_key.txt
n whichkey.lua
n whichkey.txt 
n whitelist.py
n whitespace.lua
n whl2txz
n windows.py
n wjp_city_list.json 
n woff2woff2
n wordeditor.py
n words
n words-1
n words.json
n wrapper.py
n wrapper_felo
n wrapper_felo.py
n wrapper_gh
n write_a_python_script_to_detect_pkg_reso.txt
n wtmp
n www
n x5
n x5.py
n x5.py 
n xcod.py
n xds_client_test.cc 
n xero.md
n xmlwf
n xreport
n xreport.py
n xreport2
n xreport_20260822_212051.py
n xxr
n xxx
n y6.py
n y7.py
n y8.py
n yanky.lua
n yap
n yap.py
n yap.pyi
n yijoxhbemv.txt 
n ykkfasupyd.vim 
n ylines.py 
n you
n you_should_make_personal_versions_of_songs_you_like.html
n yt
n yt2txt.sh
n ytt101.sh 
n ytt202.sh 
n ywnpqyredy.css 
n z.html
n z5
n z5.py
n z5.py 
n z5r
n zensical.toml
n zipapp.py
n zreport
n zs.py
n zs.py 
n zsr
n zstder
n zstder.py
n zstder.py 
n ~/.bash_history
n ~/bin/armc
n ~/bin/asteval
n ~/bin/autoclone
n ~/bin/crawler
n ~/bin/dj
n ~/bin/fix_escape
n ~/bin/fix_pkgres
n ~/bin/man_doc
n ~/bin/mdview
n ~/bin/mkx
n ~/bin/nolua
n ~/bin/pipget
n ~/bin/pp_pdfminer2
n ~/bin/restore_all_historical_deletions
n ~/bin/rmc
n ~/bin/rmc_cst
n ~/bin/shiftsrt
n ~/bin/tojson
n ~/bin/translate
n ~/bin/twin_files
n3
nano .bashrc
nb
nbimgviewer
nbq14
nc
ncdu
ncdu2
nco f
nconf
ncong
nd t3
new2old
new_repo
newest_files
newrepo
nf
ninstall_nvim.sh
nll
nmost_repeated_words pip.txt 11
nmost_repeated_words pip.txt 5
nmost_repeated_words pip.txt 50
nmost_repeated_words pip.txt 55
nn
nnn
no lua
node api.js
node cli.js 
node generate-typescript-interfaces.js 
node index.js
node nvim.js
nolua
noneng
noreq
not --help
not 4
not llvm-tools_21.1.8-3_arm.deb
npm --version
npm i -g @swc/cli @swc/core esbuild
npm i -g bash-language-server
npm i -g cspell
npm i -g esbuild
npm i -g felo-ai@latest
npm i -g neovim
npm i -g vim-
npm i -g vim-language-server
npm i @heyputer/puter.js --save-dev
npm init
npm run build
npm uninstall -g esbuild
npm uninstall -g html-minifier
npm uninstall -g minify
npm uninstall -g vim-language-server
nv .git ../mupdf/
nv Terminal\ transcript.txt  trend_py10.txt
nv fa.json ..
nvim --headless -c "Lazy sync" -c qall
nvim --headless -c "checkhealth" -c qall
nvim --headless -c ':TSUpdate markdown markdown_inline' -c qall
nvim --headless -c 'Lazy log' -c qall
nvim --headless -c 'Lazy sync' -c qall
nvim --headless -c 'checkheaLazy sync' -c qall
nvim --headless -c 'checkhealth' -c qall
nvim --version
nvim_checkhealth
nvonf
o'c9
oldpi
oldpy
only_in_first = []
only_in_first = [p for p in lines1 if p not in set2]
only_in_first.extend(future.result())
only_in_second = [p for p in lines2 if p not in set1]
opti openjpeg
otf2woff2 FiraMonoNerdFont-Bold.otf
oó
p
path
pc
perpage
perpage reymont.pdf 
perpage2
perpage2 big.pdf
perpage2 lp.pdf
perpage2 tinfoil.pdf
pfzf
pgco
phco
phuff -i buffering.py -o buff.huff
phuff buffering.py
phuff encode -i buffering.py -o buff.huff
phuff encode -i pip.txt -o 1.huff
pii  fonttools httpcore2
pii  httpx multidict pipcl ppdeep virtualenv seledroid
pii  httpx multidict pipcl ppdeep virtualenv seledroid anyio
pii "google-api-core[grpc]
pii "google-api-core[grpc]"
pii 'hatch_jupyter_builder'
pii -r all
pii -r hh
pii -r jaraco 
pii -r req.txt
pii -r req.txt 
pii -r requirements.txt
pii -r requirements.txt 
pii BeautifulSoup4
pii accelerate
pii aim
pii aiofiles
pii aiofiles accelerate
pii anyio
pii anyio httpx multidict pipcl ppdeep virtualenv seledroid
pii babel
pii backports.zstd
pii beautifultable validators
pii cookiecutter
pii courlan
pii courlan cssselect2 htmldate justext pydyf
pii cppyy-backend cppyy-cling
pii cramjam-2.12.1-cp312-cp312-linux_armv8l.whl 
pii cryptography-1.4.7-py3-none-any.whl
pii cryptography-50.0.1-cp312-abi3-linux_armv8l.whl 
pii cython-3.3.0a2.dev0-cp312-cp312-linux_armv8l.whl
pii dist/aiohttp-3.9.5-py3-none-any.whl 
pii dist/binaryornot-0.4.4-py3-none-any.whl
pii dist/cchardet-2.2.0a2-cp312-cp312-linux_armv8l.whl 
pii dist/cld-1.4.7-py3-none-any.whl
pii dist/cmake-4.4.3-py3-none-any.whl
pii dist/dh-1.4.7-py3-none-any.whl
pii dist/docopt-1.4.7-py3-none-any.whl
pii dist/faprint-1.4.7-py3-none-any.whl
pii dist/fh8-1.4.7-py3-none-any.whl
pii dist/flake8_use_fstring-1.4-py3-none-any.whl
pii dist/fonttools-4.63.1.dev0-cp312-cp312-linux_armv8l.whl
pii dist/gast-0.7.0-py3-none-any.whl
pii dist/gcld3-3.0.13-cp312-cp312-linux_armv8l.whl
pii dist/gevent-26.8.0-cp312-cp312-linux_armv8l.whl 
pii dist/google_ai_generativelanguage-0.12.0-py3-none-any.whl
pii dist/greenlet-3.5.5-cp312-cp312-linux_armv8l.whl
pii dist/gumbo-0.10.1-py3-none-any.whl
pii dist/hatch-0.0.1.dev1-py3-none-any.whl
pii dist/html5lib-1.1-py2.py3-none-any.whl 
pii dist/html_to_text-1.0.0-py3-none-any.whl
pii dist/hunspell-0.5.5-cp312-cp312-linux_armv8l.whl
pii dist/img2art-0.4.3-py3-none-any.whl
pii dist/installer-1.0.1-py3-none-any.whl 
pii dist/json_prettifier-1.4.7-py3-none-any.whl
pii dist/kociemba-1.2.1-cp312-cp312-linux_armv8l.whl
pii dist/langdet-1.4.7-py3-none-any.whl
pii dist/libcst-1.9.0-cp312-cp312-linux_armv8l.whl
pii dist/librt-0.15.0-cp312-cp312-linux_armv8l.whl
pii dist/lingua-1.4.7-py3-none-any.whl 
pii dist/loki-0.5.6-py3-none-any.whl
pii dist/mechanize-0.4.10-py2.py3-none-any.whl 
pii dist/nab_index-0.0.17-py3-none-any.whl 
pii dist/nab_markersets-0.0.17-py3-none-any.whl 
pii dist/nab_resolver-0.0.17-py3-none-any.whl 
pii dist/numba-0.67.0-cp312-cp312-linux_armv8l.whl
pii dist/openai_whisper-20250625-py3-none-any.whl
pii dist/pdfminer_six-0.1.dev1+ga18de2a9c-py3-none-any.whl
pii dist/phuff-1.4.7-py3-none-any.whl
pii dist/pip_tools-7.6.2.dev38-py3-none-any.whl
pii dist/pipcl-12-py3-none-any.whl
pii dist/pipdown-1.4.7-py3-none-any.whl
pii dist/ppdeep-1.4.7-py3-none-any.whl
pii dist/prettier-1.0.0-py3-none-any.whl
pii dist/py_mini_racer-0.6.0-py3-none-any.whl
pii dist/pychm-0.8.6-cp312-cp312-linux_armv8l.whl
pii dist/pyget-0.1.0-py3-none-any.whl
pii dist/pylzma-0.6.1-cp312-cp312-linux_armv8l.whl
pii dist/pynacl-1.6.2-cp312-cp312-linux_armv8l.whl
pii dist/pyncdu-0.0.4-py3-none-any.whl 
pii dist/pyppmd-0.0.0-cp312-cp312-linux_armv8l.whl
pii dist/pyrival-0.0.post1+g6a87b91b3.d20260814-py3-none-any.whl
pii dist/pyspell-0.1.0-py3-none-any.whl
pii dist/pysrt-1.1.2-py3-none-any.whl
pii dist/pywavelets-1.9.0-cp312-cp312-linux_armv8l.whl
pii dist/pyzmq-27.1.0-cp312-cp312-linux_armv8l.whl
pii dist/refactor_utils-1.4.7-py3-none-any.whl
pii dist/robofab-1.2.1-py3-none-any.whl
pii dist/setuptools-84.0.0-py3-none-any.whl 
pii dist/spylls-0.1.7-py2.py3-none-any.whl
pii dist/summarize-1.4.7-py3-none-any.whl
pii dist/termuxgui-0.1.6-py3-none-any.whl
pii dist/textual_nvim-0.1.0-py3-none-any.whl
pii dist/textual_nvim-1.4.7-py3-none-any.whl
pii dist/tornado-6.5.8-cp39-abi3-linux_armv8l.whl
pii dist/tree_sitter_css-0.25.0-cp312-abi3-linux_armv8l.whl
pii dist/tree_sitter_markdown-0.2.3-cp38-abi3-linux_armv8l.whl
pii dist/tree_sitter_python-0.25.0-cp312-abi3-linux_armv8l.whl
pii dist/tree_sitter_rust-0.24.2-cp312-abi3-linux_armv8l.whl
pii dist/ujson-5.13.0-cp312-cp312-linux_armv8l.whl
pii dist/unix_ar-0.2.1-py2.py3-none-any.whl
pii dist/uv_mock-0.0.1-py3-none-any.whl
pii dist/walkdir-1.4.7-py3-none-any.whl
pii dist/xxhash-4.0.1-cp312-cp312-linux_armv8l.whl 
pii dist/zope_interface-8.6-cp312-cp312-linux_armv8l.whl
pii dist/zoxide-1.4.7-py3-none-any.whl
pii dnslib
pii docopt
pii docopt gast python_lsp_jsonrpc sqlalchemy
pii domdf-python-tools
pii dulwich
pii dutree
pii dutree-1.8-py3-none-any.whl 
pii et-xmlfile
pii fastjsonschema ipykernel jupyter_builder jupyter_lsp jupyter_core
pii filetype
pii fissix
pii flakeheaven
pii flexcache flexparser
pii gitpython
pii google_genai
pii gpxpy
pii grpcio-1.83.1-cp312-cp312-linux_armv7l.whl
pii hatchling
pii html5lib installer
pii img2art-0.4.3-py3-none-any.whl
pii isort-8.0.1-py3-none-any.whl
pii itsdangerous
pii jaraco_packaging
pii jinja2 json5 notebook-shim
pii jiter-0.16.0-cp312-cp312-linux_armv8l.whl 
pii jupyter-client
pii justext
pii langdetect
pii lazy_loader
pii lxml-6.1.1-cp312-cp312-linux_armv8l.whl
pii lxml_html_clean
pii markdown
pii mccabe
pii memory_profiler
pii minify_html-0.18.1-cp312-cp312-linux_armv8l.whl
pii more-itertools --no-cache-dir tld cssselect2 httpx2 cairocffi appdirs pyee sniffio click-option-group docopt-ng pycountry cachecontrol rsa breadability pyaes proglog editorconfig webencodings pyphen
pii mypy
pii nab
pii natsort
pii nest-asyncio2
pii nh3-0.3.6-cp312-abi3-linux_armv8l.whl
pii nh3-0.3.7-cp312-abi3-linux_armv8l.whl 
pii numba-0.67.0-cp312-cp312-linux_armv8l.whl
pii numpy-2.5.1-cp312-cp312-linux_armv8l.whl
pii nutrient-sdk-native
pii nutrient_sdk-1.0.11-py3-none-any.whl
pii outcome catalogue annotated-doc ansicolor docstring-to-markdown frozenlist flask
pii pandas-2.3.3-cp312-cp312-linux_armv8l.whl
pii pdfplumber
pii perf
pii perplexityai-0.43.3-py3-none-any.whl
pii pip-25.0.1-py2.py3-none-any.whl
pii pipdown-1.4.7-py3-none-any.whl
pii ply
pii prometheus-client
pii proto_plus
pii pygit2-1.19.3-cp312-cp312-linux_armv8l.whl
pii pygithub
pii pylibmspack-0.4.0-cp312-cp312-linux_armv8l.whl
pii pylsp-mypy
pii pyncdu
pii pypdfium2-5.13.0-cp312-cp312-linux_armv8l.whl
pii pyperf
pii pysrt
pii pysub2
pii pysubs2
pii python-lsp-jsonrpc
pii python_bidi-0.6.11-cp312-cp312-linux_armv8l.whl
pii pywavelets-1.9.0-cp312-cp312-linux_armv8l.whl
pii replicate==2.0.0b4
pii rpds_py-2026.6.3-cp312-cp312-linux_armv8l.whl
pii safetensors-0.8.0-cp310-abi3-linux_armv8l.whl
pii scikit_image-0.25.2-cp312-cp312-linux_armv8l.whl
pii scipy-1.16.3-cp312-cp312-linux_arm.whl
pii scipy-1.16.3-cp312-cp312-linux_armv8l.whl
pii setuptools-84.0.0-py3-none-any.whl
pii setuptools_rust setuptools_scm
pii simsimd-6.5.3-cp312-cp312-linux_armv8l.whl
pii slugify
pii smart-open
pii speedtest
pii speedtest_cli-2.1.3-py2.py3-none-any.whl
pii sqlalchemy
pii sqlite-fts4
pii sqlparse restructuredtext-lint flake8-plugin-utils cognitive-complexity
pii ssdeep-3.4-cp312-cp312-linux_armv8l.whl
pii target/wheels/cramjam-2.12.1-cp312-cp312-linux_armv8l.whl
pii target/wheels/fastwalk-1.4.7-cp312-cp312-linux_armv8l.whl
pii target/wheels/safetensors-0.8.0-cp312-abi3-linux_armv8l.whl
pii telethon
pii thonny_textual-1.4.7-py3-none-any.whl
pii tiktoken-0.12.0-cp312-cp312-linux_armv8l.whl
pii tldextract async-generator cssselect drissionget drissionrecord
pii truststore future
pii truststore future fonttools httpcore2
pii vcs_versioning
pii werkzeug
pii xlsxwriter websockets protobuf pluggy
pii xxhash-3.6.0-cp312-cp312-linux_armv8l.whl
pii xxhash-4.0.1-cp312-cp312-linux_armv8l.whl 
pii yt-dlp
pii zopfli-0.4.3-cp310-abi3-linux_armv8l.whl
ping 64.6.64.6
ping 8.26.56.56
ping google.com
pio uninstall langdet
piodown pylzma
pip -V
pip check
pip config --help
pip config list
pip download pip==20.3.4
pip freeze > pip.freeze
pip imstall coverage coveralls
pip index versions aiohttp
pip index versions cramjam
pip index versions flake8
pip index versions joblib
pip index versions mypy
pip index versions pip
pip index versions pymupdf
pip index versions pypdfium2
pip index versions pywavelets
pip insta
pip install *.whl
pip install *.whl --force-reinstall
pip install --only-binary :all: aiohttp
pip install --upgrade joblib lokipip
pip install -U flake8
pip install -e .
pip install -r mypy-requirements.txt
pip install -r requirements.txt
pip install .
pip install . --no-deps --no-build-isolation --verbose
pip install .l8plp
pip install .ll.
pip install aim -i https://mirror-pypi.runflare.com
pip install aiohttp==3.14.3
pip install altgraph
pip install annotated-types pycparser typing-inspection
pip install anyio
pip install anyio -U
pip install bandit
pip install beautifulsoup4
pip install boltons
pip install build
pip install cachetools
pip install clang
pip install cookiecutter
pip install coverage coveralls
pip install ctypesgen
pip install debfile
pip install debugpy --verbose
pip install deep_translator autopep8 black isort pylint yapf pyflakes pydocstyle pycodestyle requests cython importlib_metadata importlib_resources lizard
pip install docutils
pip install entrypoints
pip install eradicate lizard
pip install faspell
pip install fissix
pip install flake8 --force-reinstall
pip install flask-cors
pip install gcld3-3.0.13-cp312-cp312-linux_armv8l.whl
pip install git_filter_repo
pip install google-genai
pip install html_to_text html_to_txt html2text htmltotext htmltotxt
pip install htmlmin
pip install httpx
pip install huggingface-hub
pip install hypothesis
pip install joblib loguru
pip install jupyter-lsp-server
pip install jupyterlab-lsp "python-lsp-server[all]"
pip install jupyterlab-lsp-server
pip install kociemba
pip install kosiemba
pip install lz4-4.4.5-cp312-cp312-linux_armv8l.whl
pip install lz4-4.4.5-cp312-cp312-linux_armv8l.whl --force-reinstall
pip install lzma_mt --upgrade
pip install msgpack
pip install neovim
pip install netaddr burp
pip install netaddr burp dns-python
pip install nutrient-sdk-native
pip install packaging
pip install patchelf
pip install pdfplumber==0.11.7
pip install perplexityai-0.43.3-py3-none-any.whl p
pip install persian-figlet
pip install pip-tools
pip install pipdeptree pydeptree deptree pypideptree
pip install piptools
pip install poetry_core
pip install pplx
pip install pre-commit
pip install prometheos_client
pip install protobuf
pip install py-spy pipdeptree
pip install pyasn1
pip install pybcj-1.0.7-cp312-cp312-linux_armv8l.whl
pip install pybcj-1.0.7-cp312-cp312-linux_armv8l.whl --force-reinstall
pip install pychm
pip install pycmd
pip install pydantic-2.14.0a1-py3-none-any.whl
pip install pyfiglet rich-pyfiglet textual-pyfiglet gradient-figlet
pip install pymupdf==1.16.14
pip install pynvim
pip install pynvim --no-deps
pip install pypdf
pip install pypdfium2 --verbose
pip install pyperclip
pip install pyproject-build
pip install pyproject-initializr pyproject-init
pip install pyproject2setuppy
pip install pyproject_api
pip install pyscaffold
pip install pysubparser
pip install pytest tox
pip install pytest-parallel
pip install python-dateutil
pip install python-debian
pip install python-debian --force-reinstall
pip install python-dotenv
pip install python-json-logger
pip install python-lsp-server[all] vim-vint python-lsp-isort pylsp-mypy python-lsp-black
pip install python-lsp-server[all] vim-vint python-lsp-isort pylsp-mypy python-lsp-black --no-deps
pip install python-pynvim
pip install python-telegram-bot[all]
pip install python_discovery
pip install pyupgrade
pip install radon
pip install replicate groq
pip install requests
pip install reuse
pip install robofab
pip install rst-to-myst
pip install scikit-build-core
pip install security_check-0.2-py3-none-any.whl key_logger-0.0.1-py3-none-any.whl codebase_stats-0.0.3-py3-none-any.whl
pip install send2trash
pip install setuptools flake8 flake8_helper lazr.uri lazr.restfulclient
pip install setuptools wheel packaging pyproject_metadata cython meson-python versioneer
pip install smart_open
pip install spin
pip install srt stevedore knowit guessit dogpile-cache --no-cache-dir
pip install subtitle
pip install telethon
pip install tomli_w
pip install trafilatura
pip install versioneer mason mason-python packaging
pip install versioneer meson meson-python packaging
pip install wheel
pip install xmltodict vulture watchdog dill tqdm tabulate textual
pip install xxhash-3.6.0-cp312-cp312-linux_armv8l.whl
pip instsll clang
pip list
pip list --format=json > pip.list
pip uninsta
pip uninstall aiohttp
pip uninstall anyio
pip uninstall binaryornot
pip uninstall cld
pip uninstall cppyy
pip uninstall debugpy
pip uninstall dh
pip uninstall faprint
pip uninstall faspell
pip uninstall flake8-bugbear
pip uninstall flake8-django
pip uninstall flake8-eradicate
pip uninstall flake8_variables_names flake8_use_fstring flake8_todo flake8_tidy_imports flake8_spellcheck
pip uninstall flakeheaven
pip uninstall grpcio
pip uninstall hypothesis
pip uninstall jupyterlab
pip uninstall kociemba
pip uninstall langdet
pip uninstall neovim
pip uninstall netifaces
pip uninstall nh3
pip uninstall nutrient
pip uninstall nutrient-sdk
pip uninstall pipdown
pip uninstall prettier
pip uninstall py_mini_racer
pip uninstall pyget
pip uninstall pyproject-init
pip uninstall pyproject-initializr
pip uninstall pyscaffold
pip uninstall pyspell
pip uninstall pytest
pip uninstall python-pyproxy
pip uninstall pythran
pip uninstall refactor_utils
pip uninstall spylls
pip uninstall textual_nviim
pip uninstall textual_nvim
pip uninstall zoxide
pip wheel .
pip wheel . --verbose
pipb
pipconf
pipdeptree 
pipdown PyMuPDF==1.26.5
pipdown aiohttp
pipdown aiohttp==3.14.3
pipdown aiohttp==3.9.5
pipdown brotli
pipdown cffi
pipdown flake8==4.0.0
pipdown gensim==3.8.3  # More stable older version
pipdown grpcio
pipdown llvmlite
pipdown pip
pipdown pip==20.3.4
pipdown pylzma
pipdown pymupdf==1.26.5
pipdown pynacl
pipdown pypdfium2==4.18.0
pipdown pypdfium==4.18.0
pipdownllvmlite
pipget aiohttp
pipget aiohttp==3.14.3
pipget cchardet
pipget cramjam
pipget html5lib
pipget installer
pipget jiter
pipget librt
pipget lingua
pipget lingua-language-detector
pipget lubrt
pipget mypy
pipget nab-index
pipget nab-markersets
pipget nab-resolver
pipget nh3
pipget openpyxl
pipget polars
pipget pylyzer
pipget pyxl
pipget refactor_utils
pipget robyn
pipget safetensors
pipget setuptools
pipget tiktoken
pipget tokenizers
pipget tree_sitter_tsx
pipget uncomment
pipget walkdir
pipget xxhash
pipget2 cryptography
pipget2 pyzmq
pipget2 xxhash
pipwhl jiter
pkg autoclean
pkg clean
pkg i ffmpeg
pkg i fontconfig-utils
pkg i jcal
pkg i libllvm-static
pkg i llvm-tools
pkg i mandoc
pkg i mupdf
pkg i mupdf-tools
pkg i nodejs termux-api aria2 protobuf googletest
pkg i p7zip xz-utils qpdf git gh neovim-nightly ty ruff python-ruff
pkg i python-pillow
pkg i zstd zip unzip root-repo x11-repo tur-repo python clang perl wget curl make cmake build-essential mc
pkg install git python build-essential cmake ninja libopenblas libandroid-execinfo patchelf
pkg install git python build-essential cmake ninja libopenblas libandroid-execinfo patchelf binutils-is-llvm
pkg list-installed | grep rust
pkg update
pkg upgrade
pkg_resources_reporter_autofixer
pkg_resources_reporter_autofixer.py
pkgclin
pkgres
pkgs
pkl2json serialized_dictionary.pkl
pngq
pnr --recursive -r .1
pnr --recursive -r .3
pnr --recursive -r .4
pnr --recursive -r .5
pnr --recursive -r .6
pnr --recursive -r .7
pnr --recursive -r .8
pnr --recursive -r .n
pnr -r "'"
pnr -r '-master'
pnr -r '\-master'
pnr -r 'master'
pnr -r '|'
pnr -r .1
pnr -r .2
pnr -r .3
pnr -r .4
pnr -r .480
pnr -r .5
pnr -r .6
pnr -r .7
pnr -r .720
pnr -r .8
pnr -r .sh
pnr -r .txt
pnr -r 0
pnr -r 0816
pnr -r 480.
pnr -r 720.
pnr -r 9816
pnr -r _
pnr -r _2026
pnr -r _292608
pnr -r _main
pnr -r big_
pnr -r failed-en
pnr -r hunspell_
pnr -r words_
pnr -s ' ' '_'
pnr -s - _
pnr -s .bin .ttf
pnr -s .gz .tar.gz
pnr -s .javascript .js
pnr -s .lua .spec
pnr -s .zip .whl
pnr -s :: ___
pnr -s _-_ _
pnr -s apk zip
pnr -s arsc ttf
pnr -s bin otf
pnr -s commands c
pnr -s conf json
pnr -s orig lua
pnr -s orig spec
pnr -s skel lua
pnr -s source
pnr -s source s
pnr -s woff2 ttf
pnr -t 0
pnr -t a
pnr -t b
pnr -t c
pnr -t lazy
pnr -t n
pnr -t node
pnr -t o
pnr -t source
pnr -t t
pnr -t y
pnrer
pnrrr
pp
pp_pdfminer
pp_pdfminer paper-100k.pdf 
pp_pdfminer pro.pdf
pp_pdfminer reymont.pdf 
pp_pdfminer textbook.pdf 
pp_pdfminer2 pro.pdf
pp_pdfplumber
pp_plumber
ppminer pro.pdf
ppp
pppp
ppppp
pppppp
pre-commit install
pre-commit uninstall
prettier -w .
prettier -w 60bdfd7e751a56c8.html 
prettier -w chargoon.html
prettier -w d.html
prettier -w dlsbfsupcu.js
prettier -w fp.html
prettier -w mdviewer.html
prettier -w pdfview.html 
prettier -w preview_fonts.html
prettier -w providers.html
prettier -w pypi.html
prettier -w z.html
prg '* 60'
prg 'def format_size'
prg 'vim-toml'
prg l0bGUgaDJ7Zm9udC1zaXplOjIwcHh9LnRhZ3MtdGotYm94e3
projects
protoc
ps -aux
psearch compress
psevenz
pss aspell
pss avif
pss deptree
pss dns
pss dutree
pss figlet
pss fisix
pss fissix
pss grpc
pss hypo
pss lingua
pss llvm
pss memory
pss nab
pss nacl
pss neovim
pss nvim
pss perf
pss plx
pss pplx
pss promet
pss pyproject
pss pyproject2setuppy
pss pysub
pss ssix
pss svg
pss zapier
purenotpure
putup fh8
pwd
pwd | tcs2
pwn
pwn providers.html
py
py  jump.sh
py  jump.sh -h
py  jump.sh lua
py -V
py -m fissix --fix=all -w .
py 06.py 
py 10.py 
py 13.py 
py 14.py 
py FontLabTokenize.py
py __init__.py
py a.oy
py a.py
py add_type.py
py addcomma.py abbr.json
py adder.py 
py addtype.py
py admin.py
py afk.py
py apm_demo.py
py archiveutils.py 
py ask_gemini.py 'implement shfmt in python'
py ask_gemini.py 'write a python script to convert sqlite to json'
py autorip.py
py backend_imports.py
py base.py
py bench.py
py bench.py 
py bench_mp.py 
py bench_mp.py  /
py bench_mp.py  /data/data/com.termux/files/home
py bench_mp.py  /data/data/com.termux/files/home/projects
py bench_mp.py  /sdcard
py bench_mp.py .
py bench_mp.py /sdcard/_static/
py bench_tracer.py 
py bench_woff2_compress.py 
py benchmark.py
py buffering.py
py build.py
py build_cffi.py
py buildapi.py
py c
py cf2mp.py 
py cf2mp4 zstder.py
py cf2mp4.py 
py check_missing.py bin/missing_files.json
py chunksize_bench.py 
py chunksize_bench.py /sdcard
py chunksize_bench.py /sdcard/_static/
py circle_wheels.py
py clean_gitlinks.py gitlinks.txt
py clean_json.py cma_city_list.json 
py clean_json.py wjp_city_list.json 
py cli.py
py cli.py --help
py cli.py --help version
py cli.py version
py commit_generation.py
py comp_bench.py /sdcard/book
py compression_benchmark.py /sdcard/_static/
py convert_regex.py pu02_1.sql 
py convert_to_dic.py e.json
py create_symlink.py
py create_symlink.py 
py ddup_bash_function_names
py decrypter.py
py demo-lowlevel.py
py demo.js 
py detect_multilune_text.py
py detect_multilune_text.py -a
py detect_pkgresources.py
py detect_pkgresources.py -a
py do.py
py dupwaste.py 
py dupwaste.py .
py ex_abbr.py abbr.txt
py ex_com.py 
py extcst.py
py extract_abbr.py dic_en_fa.json
py extz.py 
py fat.py fa.json
py ffi/bui
py ffi/build.py
py file.py
py fileintegrity.py
py fileutils.py
py filterlines.py rulesruff1.md
py find_failed.py enfa.json
py find_failed.py fa.json
py find_pdfminer_crypto_deps.py
py find_transliterations.py fa.json
py fix_escape.py
py fix_escape.py ..
py fix_pkgre.py
py fix_sh.py 
py fixshebang.py
py fonts_list.py
py fswalker_report4generator.py
py fswalker_report_gen.py
py fswalker_report_gen.py /
py ftl_fa.py fa.json
py gemini-code-1784300579647.py
py gemini_chat.py 
py genperf.py
py gensim_based.py
py get_available_algorithms.py
py gettrend.py
py gettrendjup.py
py gfast.py
py glm5.py
py glmchat.py
py grok.py
py hack21.py 
py isaac/may/bench/bench_woff2_compress.py
py job_utils.py
py main.py
py main.py 
py main.py 9
py mp_bench.py /sdcard/_static/
py mpbench.py 
py mpbench.py /sdcard/_static/
py mpbench.py /sdcard/book
py mutool.py
py newrepo.py
py newrepo.py 
py perpage_20260816_142037.py
py pkg_resources_reporter_autofixer.py
py port_forward.py
py py_dev.py
py py_dev.py mprun
py py_reinstaller.py 
py pydiff mk_stand.py mk_standalone.py
py pyng_20260823_221129.py google.com
py pypdfium2.py
py pypi.py 
py pypi2pip.py pypi.html
py pystone.py
py pythonShellcode.py
py recover_mht1.py 002.mhtml
py remove_header.py abb1.json
py remove_series.py
py rename.py nvim.plug
py rename.py nvim_plug
py repli.py
py rf.py
py rm_translated_lines.py abbr.txt
py rmc.py
py ruff_rulles 
py run_parallel_design.py
py run_tests.py 
py run_util.py 
py sanity2.py
py scripts/fix_escape.py
py setup.py bdist_wheel
py shiftsrt.py
py speedtest.py
py split_multiline.py c1.lua 
py split_multiline.py c2.lua 
py split_multiline.py c3.lua 
py split_multiline.py c4.lua 
py split_multiline.py c5.lua 
py splitfile.py dirb2.py
py t.py
py tcg fontconverter.py
py tcs fontconverter.py
py telethon0.py
py telethon1.py
py telethon2.py
py test.py 
py test1.py
py test2.py
py test_1.py 
py test_bench.py 
py test_get_files.py
py test_hunspell.py
py test_mp.py
py test_url.py
py together.py
py tools/build_rust.py 
py tools/release.py 
py tools/vendored.py 
py topics.py
py txtext
py urlchecker.py
py utils.py
py v1.py
py v1.py a.py
py v1.py t.py
py v2.py
py v2.py b.py
py vv.py
py vv.py -h
py vv.py a*
py vv.py libcst
py vv.py pip
py wheel_summary.py
py zstder.py 
py-compile *.py
py-compile state.py
py314 decrypter.py
pycatimg
pycatimg screenshot_from_discord.png h
pyco
pycommon ls ls2
pydiff .bashrc .bashrc_2
pydiff 01_fa 01_fa_1
pydiff 40.py 41.py
pydiff aaa.py bbb.py
pydiff hejri.py hijri.py
pydiff index_11.html index_16.html
pydiff ls ls2
pydiff mdv.py rme.py
pydiff mk_setup.py create_setup.py
pydiff mk_stand.py mk_stand2.py
pydiff mk_stand.py mk_standalone.py
pydiff precise1.css precise.css
pydiff providers.html providers_cleaned.html
pydiff providers.py providers_cleaned.html
pydiff refactor_proj merge_pkg
pydiff rpack.py rpkgr.py
pydiff slp.py split_lua_plugins.py
pydirb
pydoc3.14 ../lib
pydocr
pydos2unix
pyenv
pyenv --help
pyenv binary
pyenv binary --help
pyenv binary 2.7.18
pyenv binary generate-installer --help
pyenv binary package --help
pyenv binary package 2.7.18
pyenv binary python
pyenv glibal 2.7.18
pyenv global 2.7.18
pyenv init bash
pyenv local 2.7.18
pyenv rehash
pyenv use 2.7.18
pyenv versions
pyenv which
pygdu
pyge5 pylzma
pyget greenlet
pyget libcst
pyget numba
pyget pip==20.3.4
pyget pycryptodome
pyget pylzma
pyget pynacl
pyget pypdfium version=4.18.0
pyget pyzmq
pyget pyzmq numba
pyget tornado
pyget uvloop
pyget werkzeug
pyinstaller rmc.py -F
pyinstaller search.py
pylint --generate-rcfile
pylint --generate-rcfile > .pylintrc
pylint --he
pylint --help
pylint --only-errors *.py
pylint -E a*.py
pylint -E autofix_typo.py
pylint config help
pylyzer 
pylyzer --help
pylyzer -?
pylyzer bnn.py
pylyzer class.py 
pylyzer import.py 
pylyzer settings.py 
pylyzer test.py
pylyzer x5.py
pylyzer yap.py
pyminify
pync -c 8.26.56.26
pyng  8.26.56.26
pyng -c 8.26.56.26
pyng google.com
pyng irancell.ir
pyproj chat_client
pyproj cryptography
pyproj fh8
pyproj lingua
pyproj mhtml-to-html
pyproj pcurl
pyproj pdf.js_wrapper
pyproj prettier
pyproj pypdfium2
pyproj pyprettier
pyproj summarize
pyproj svgo
pyproj textual_nvim
pyproj2 fh8
pyproject-init --help
pyproject-init --setup mypkg
pyproject-init -s mypkg
pyproject-init app mypkg
pyproject-init app mypkg -d
pyproject-init app mypkg -s
pyproject-init app mypkg -s -l
pyproject-init app mypkg -s -l MIT
pyproject-init lib -s mylib
pyproject-initializr --create pkg
pyproject-initializr lib
pyrefly --help
pyrefly check yap.py
pyrefly infer hijri.py
pyrefly infer setup.py
pyrefly infer walkdir.py
pyrefly infer walkdir.py  -o w.py
pyrefly infer walkdir.py -- -o w.py
pyrefly infer zs.py 
pyrefly init
pyrg
pyrg '"""'
pyrg '* 60'
pyrg '/usr/bin/python'
pyrg '20.3.4'
pyrg '= ...'
pyrg '= \.\.\.'
pyrg '@import'
pyrg 'QGNoYXJzZXQgIlVURi04IjthYmJ'
pyrg 'QGNoYXJzZXQgIlVURi04IjthYmJyLGFkZ'
pyrg '\* 60'
pyrg '\* 70'
pyrg '\* \d\d'
pyrg 'apply_async'
pyrg 'base64,'
pyrg 'binaryornot.check'
pyrg 'def format_size
pyrg 'def format_size'
pyrg 'def fsz'
pyrg 'def get_file_age'
pyrg 'def get_installed'
pyrg 'def get_installed_'
pyrg 'def get_pyfiles'
pyrg 'def get_pyfiles('
pyrg 'def get_size
pyrg 'def get_size'
pyrg 'def gsz'
pyrg 'def human'
pyrg 'def is_binary
pyrg 'def is_binary'
pyrg 'def is_binary''
pyrg 'def mpf3'
pyrg 'def unique_path'
pyrg 'env python'
pyrg 'env'
pyrg 'environment'
pyrg 'exec)'
pyrg 'exec\('
pyrg 'exec\)'
pyrg 'font-face'
pyrg 'from Pathlib
pyrg 'from Pathlib'
pyrg 'get_file_age'
pyrg 'get_latest_ver'
pyrg 'gh '
pyrg 'import os'
pyrg 'import pkg_res'
pyrg 'import pkg_resources'
pyrg 'only-if'
pyrg 'only-when'
pyrg 'plugins\.lsp'
pyrg 'pysrt.'
pyrg 'requests.get'
pyrg 'self.'
pyrg 'termco
pyrg 'termcolor'
pyrg 'tree_sitter_javascript'
pyrg 'tree_sitter_lang'
pyrg 'tree_sitter_typescript'
pyrg 'usr'
pyrg 'usr/bin/env python'
pyrg 'vim-toml'
pyrg 'vim.opt.'
pyrg 'with_requests'
pyrg Tide
pyrg apply_async
pyrg felo
pyrg get_pyfiles
pyrg jedi
pyrg log/app
pyrg log/apps
pyrg m8ni
pyrg mini
pyrg pylint
pyrg runflare
pyrg sqlite
pyrg termcolor
pyrg translit
pyrg zoxide-py
pyright --createstub
pyright --createstub *.py
pyright --createstub dh
pyright --createstub pathlib
pyright --createstub pathlib venv
pyright --createstub pathlib venv joblib pip wheel setuptools
pyright --createstub re
pyright --createstub yap.py
pyright --help
pyright --stats .
pyright --stub
pyright --version
pyright a*.py
pyright appendr.py
pyright jobutils.py
pyroject build
pysanity-check
pysplit abbr.txt 2
pysplit fa.txt 4
pysplit hunspell.txt 4
pysplit w 3
pysvg
pytest -vv .
pytg lig/app
pytg log/app
python -V
python -c 'import dh; print(dh.__file__)'
python -m build -w
python -m build -w --verbose
python -m doctest __init__.py
python -m ensurepip
python -m fissix --fix=all -w *.py
python -m fissix --fix=all -w --verbose .
python -m fissix -w --fix=all *.py
python -m fissix -w --fix=all .
python -m fissix -w --fix=all do.py
python -m fissix -w --fix=all genperf.py
python -m maturin build
python -m maturin build --features all --verbose
python -m maturin build --features xz,deflate,snappy,brotli,bzip2,lz4,zlib,zstd,blosc2  --verbose
python -m maturin build -v
python -m maturin build -v --release
python -m pip download --no-deps --no-binary :all: flakeheaven==3.3.0
python -m pip install opensubtitlescom
python -m pip show dh
python -m pyppeteer
python -m site
python -m textual_nvim
python -m unittest test_hunspell.py
python -m venv venv
python PYZ-00.pyz
python setup.py --help
python setup.py bdist_wheel
python setup.py bdist_wheel  -use-mypyc
python setup.py bdist_wheel --use-mypyc
python3.14
python3.14 perpage.py /sdcard/book/big.pdf
q1
q1 1
q1!
q2
qqqĺl
qv
r, mkdocs.yml
r, t1.json
r2h
radon --help
radon cc  bnn.py
radon cc hal yap.py
radon cc raw mi hal yap.py
radon mi  bnn.py
radon raw  bnn.py
radon yap.py
random_font
randomize_dircolors
rcs
rdmp
re'os
reinstaller
remove_duplicate_functions.py
remove_duplicate_functions.py ~/isaac/pkgs/dh/src/dh/fileutils.py
remove_duplicate_functions.py ~/isaac/pkgs/dh/src/dh/fileutils.py x5.py
remove_func
remove_func -a
remove_func -i
remove_gsz
remove_gsz -a
remove_gsz.py
remove_gsz.py -a
rename_html_by_title
rename_html_by_title --apply
rename_html_by_title -a
rename_html_by_title index.html
rename_svg_fonts
repis
replacer    "sys.argv[0] = sys.argv[0].removesuffix('.exe')" ''
replacer '# add type annotations to code ' '# add type annotations to functions/classes(and their args) and constant definitions, variables if missing'
replacer '(fonts/' '(https://inventwithpython.com/automate3workbook/fonts/'
replacer '* 50' '* 42'
replacer '* 60' '* 42'
replacer '* 70' '* 42'
replacer '* 80' '* 42'
replacer '\m' ''
replacer '\n' ''
replacer 'files/usr' 'files/home/.local'
replacer 'files/usr' 'files/home/.pyenv/versions/2.7.18'
replacer 'from __future__ import annotations' ''
replacer 'from pool_helper import as_completed' 'from dh import as_completed'
replacer 'from pool_helpers import as_completed' 'from dh import as_completed'
replacer 'n_jobs=2' 'n_jobs=8'
replacer 'n_jobs=4' 'n_jobs=8'
replacer 'n_jobs=None' 'n_jobs=8'
replacer 'python-template-project' '<pkg-name>'
replacer 'python_template_project' '<pkg-name>'
replacer 'sudo ' ''
replacer 'sys.exit(main())' 'raise SystemExit(main())'
replacer /usr /home/.local
replacer FONT_EXT FONTEXT
replacer IMG_EXT IMGEXT
replacer mason-org mason-org
replacer mhtml-to-html mhtml_to_html
replacer prettier pyprettier
replacer pyprettier prettierpy
replacer williambohem mason-org
replacer williamboman mason-org
replacer zoxide-py zoxide
repod
report_diff_lines(f1, f2)
repos
reqmaker
restore_all_historical_deletions
restore_all_historical_deletions --help
restore_all_historical_deletions -c
restore_all_historical_deletions -f
return [p for p in chunk if p in exclude_set]
return [p for p in chunk if p not in exclude_set]
return path, lines
return path.read_bytes().count(b"\n") + 1
reuse --help
revdic dic0.json
revdic dic3.json
revdic dictionary.json
rfa
rfd
rff *
rff .*
rff ./~
rff .appveyor/
rff .bzr-builddeb/
rff .cache/nvim/
rff .git
rff .git*
rff .githooks/
rff .github
rff .github/
rff .gitignore
rff .guthub
rff .idea/
rff .local/state/nvim/
rff .mypy_cache/
rff .npm
rff .ropeproject/
rff .thumbnails/
rff .tox
rff .translate/
rff .travis
rff .venv/
rff .vscode/
rff 0
rff CHMLib/
rff CodeArt.wiki-sync/
rff CodeArt/
rff META-INF/
rff Tide.nvim/
rff _build_backend/
rff _cacache/
rff _logs/
rff _static
rff _static/
rff _templates/
rff after/
rff aiohttp-0.13.1.dist-info/
rff alg
rff anyio
rff anyio-4.1*
rff apps/
rff arm
rff arsc
rff ashen
rff astroid-4.0.4.dist-info/
rff autoload/
rff avante.nvim/
rff avif
rff backup
rff bin
rff black/
rff blex
rff body
rff buid_cross/
rff build
rff build/
rff c h
rff changelog.d/
rff changelog/
rff changes/
rff citruszest.nvim/
rff class
rff click-8.3.3.dist-info/
rff click-8.4.2.dist-info/
rff cmaps/
rff cmp-*
rff colabtools/
rff conf
rff copilot*
rff copilot.vim/
rff cryptography
rff cryptography-1.4.7.dist-info/
rff cryptography-50.0.1/
rff cryptography/
rff cryptography_631c3f3bdc6e40b187e2d59fcab1f201/
rff cson/
rff css
rff ctypesgen-1.1.1.dist-info/
rff dat
rff data
rff debian/
rff demo
rff dex
rff dics
rff dist
rff doc
rff docs
rff docs/
rff docutils-0.19.dist-info/
rff dot_file/
rff downloads
rff ember/
rff external/
rff extracted_base64/
rff far
rff fitz*
rff flake8-4.0.0.dist-info/
rff flake8-7.1.2.dist-info/
rff flakehell/
rff formula-template/
rff freetype2/
rff ftdetect/
rff gif
rff giff javascript/ js json xml
rff git_backup_20260824_113900/
rff glance.nvim/
rff google_ai_generativelanguage-0.12.0/
rff greenlet-3.5.5/
rff grpc
rff gui
rff home-assist*
rff homebrew/
rff html
rff html5lib-1.1/
rff http-v2/
rff i
rff importlib_metadata-9.0.0.dist-info/
rff indent_blankline/
rff index-v5/
rff info
rff isort-8.0.1.dist-info/
rff jar
rff jedi
rff jedi/
rff jellybeans.nvim/
rff jiter-0.16.0/
rff jpg png svg webp
rff jpg png svg webp x-icon gif
rff kanagawa.nvim/
rff kanso.nvim/
rff kitty-scrollback-minimal-config/
rff l
rff lake-dweller.nvim/
rff lazr_uri-1.0.8.dist-info/
rff lechat-mobile/
rff libcst/
rff libcst_1b39614cc4e745f285bc7509f844c612/
rff libpng1*
rff libscanbuild/
rff licenses/
rff log
rff lp
rff lspsaga.nvim/
rff lua
rff lua-language-server/
rff lvim
rff lvim/
rff m
rff makurai-nvim/
rff man
rff man/
rff material.nvim/
rff mbn cts raw smfb 
rff melange-nvim/
rff minify_html
rff modus-themes.nvim/
rff mupdf/
rff mupdf/*
rff mytheme/
rff n
rff neovim
rff nh3-0.3.7/
rff nls
rff nlsp-settings.nvim/
rff no_extension/ fst csv ubm
rff none-ls.nvim/
rff npm
rff numpy
rff nvim
rff nvim*
rff nvim-*
rff nvim-astrovim/
rff nvim-cmp/
rff nvim-colorizer.lua/
rff nvim-llama/
rff nvim-music-player/
rff nvim-nvchad/
rff nvim-ufo/
rff nvim/
rff openai-2.50.0.dist-info/
rff org
rff out
rff output
rff output.tar.zst
rff output/
rff oxocarbon.nvim/
rff pdf.js_wrapper/
rff pdfminer.six/
rff persian/
rff pip
rff pip*
rff pip-20.3.4.dist-info/
rff pip-25.0.1.dist-info/
rff pip-26.2.1-py3-none-any.whl
rff pip-tools-main/
rff pipcl
rff platform/
rff platformdirs-4.11.3.dist-info/
rff plugin/ snippets/ spell
rff png
rff png xml pb
rff ppdeep/
rff pre-commit/
rff pro
rff promise-async/
rff py
rff py_mini_racer-0.6.0/
rff pyb
rff pycmd-fork/
rff pycodestyle-2.12.1.dist-info/
rff pyflakes-3.2.0.dist-info/
rff pylibmspack-0.4.0/
rff pylint-4.0.7.dist-info/
rff pylyzer-0.1.0b0.data/
rff pylyzer-0.1.0b0.dist-info/
rff pymple.nvim/
rff pymupdf
rff pymupdf1.16.14/
rff pypdfium2
rff pyprettier/
rff pyproject_initializr-1.0.1.dist-info/
rff pyrival/
rff pyspell/
rff python3.12/
rff pythonstatic/
rff pywavelets
rff pywavelets-1.9.0/
rff pyzmq-27.2.0/
rff queries/
rff release/
rff render-markdown.nvim/
rff resources/
rff rubiks-cube.nvim/
rff ruff
rff ruff-0.16.5.dist-info/
rff scikit_image-0.26.0/
rff scripts/
rff site
rff snippets/snipmate/
rff so
rff sonokai/
rff spylls/
rff src
rff stream/
rff sublime*
rff summarize/
rff svg
rff svg gif png jpg
rff syntax/
rff t
rff t*
rff target
rff tessdata/
rff tessdata_best/
rff test
rff tests
rff tests/
rff thonny_textual/
rff tik
rff token8zers/
rff trafilatura-2.1.0.dist-info/
rff traitlets-5.15.1.dist-info/
rff trakit-0.2.5.dist-info/
rff tree-sitter-c/
rff tree-sitter/
rff tsp
rff ttt
rff typing_tests/
rff ultisnips*
rff uncomment-3.6.0/
rff undo
rff unicode.vim vim-eunuch/
rff unix_ar/
rff usr/
rff vague.nvim/
rff venv
rff vim-*
rff vim-commentary/
rff vim-highlighturl/
rff vim-markdownfootnotes/
rff vim-moonfly-colors/
rff vim-nightfly-guicolors/
rff vim-resize/
rff vim-scriptease/
rff virtualenv/
rff webp
rff wheels/
rff wheels/.
rff wheels/df/45/bb/2e4a2e22ca2b4e77a885ed192c2acf8ad6fbf1275db0f0c993/
rff wheels/f7/bf/ca/ec5627c1153fa11a9e35c08d4da191793def8bd3c37fc16fe5/
rff whitespace.nvim/
rff whl
rff win*
rff xcb-proto-1.17.0
rff xml
rff xsd txt sql
rff yapftests/
rff zsh
rff ~/.translate/
rfr
rfs
rg  lua_ls
rg '= true'
rg 'Installing pip is forbidden, this will break the python-pip package'
rg 'check = true'
rg 'checker = true'
rg 'compile\('
rg 'env python'
rg 'git clone'
rg 'import pkg_resources'
rg 'paste a block of code'
rg 'paste a block'
rg 'paste a'
rg 'paste'
rg 'plugins.lsp'
rg 'plugins\.lsp'
rg 'sys.argv[1]'
rg 'sys\.argv\[1\]'
rg 'tbl.flatten'
rg 'vim.opt'
rg 'vim.opt.'
rg 'xt/css;base64,QGNoYXJzZXQgIlVURi04IjthYmJyLGFkZ'
rg 12
rg 25
rg 313
rg 314
rg CodeArt
rg IMG_EXT
rg LuaSnip
rg Parallel
rg SKIP_DIRS
rg _EXT
rg alpha
rg astunparse
rg avi
rg avif
rg base64
rg binaryor
rg binaryornot
rg blink
rg catpp
rg cmd
rg codeart
rg codediff
rg concurrent
rg configure
rg copy_tree
rg copyfileobj
rg cryptography
rg dev
rg diff
rg dulwich
rg epilog
rg exec
rg exec\)
rg ffs
rg ffs\(
rg file_path
rg fish
rg foot
rg forbidden
rg fzf
rg fzf-native
rg get_context
rg get_size
rg git
rg github
rg gitlab
rg gzip
rg has_doc
rg human
rg import
rg jedi
rg jose
rg jose-elias
rg libs
rg llvmlite
rg ls
rg lua-ls
rg lua_ls
rg mason
rg melig
rg meligr
rg meligris
rg mkv
rg modifiable
rg move_dir
rg multip
rg multiprocess
rg n_jobs
rg neogit
rg netrw
rg none
rg none-ls
rg normalize_name
rg nvim-tree
rg ollama
rg on_save
rg only
rg p00f
rg persian
rg pkg_res
rg pkg_resources
rg pkg_resources_reporter_autofixer
rg plugins.lsp
rg pool_helper
rg pyright
rg python
rg python3
rg rainbow
rg rainbow-delimiter
rg requir
rg run_parallel
rg runflafe
rg runflare
rg search
rg serialized
rg shell
rg snack
rg snip
rg spring
rg sqlite
rg starmap
rg submodule
rg symlink_to
rg telethon
rg termux
rg theme
rg timeout
rg translite
rg transliterat
rg ultis
rg urlmarker
rg usr
rg will
rg william
rg williamboman
rg yank
rg zfill
rg zoxide-py
rg zoxide_py
rif
rm
rm  a23.tar
rm  babel.tar.zst
rm  en_freq.json
rm  jedi.tar.zst
rm  jupyterlab.tar.xz
rm  lua.tar.xz
rm  mk_stand2.py
rm  notebook.tar.zst
rm  pandas.tar.xz
rm  py_reinstaller.py 
rm  scipy.tar.xz
rm "*::*"
rm "*\:\:*"
rm "*___*"
rm '*::*'
rm '*___*'
rm *
rm *,aria2
rm *.7z
rm *.aria2
rm *.chm
rm *.class
rm *.cloning
rm *.db
rm *.deb
rm *.gz
rm *.h
rm *.html
rm *.ico
rm *.info
rm *.java
rm *.jpg
rm *.js
rm *.json
rm *.log
rm *.lua
rm *.md
rm *.mhtml
rm *.mhtnl
rm *.mkv
rm *.net
rm *.o
rm *.otf
rm *.png
rm *.pth
rm *.py
rm *.pyc
rm *.pyi
rm *.save
rm *.sh
rm *.so
rm *.spec
rm *.srt
rm *.svg
rm *.tar
rm *.ttf
rm *.txt
rm *.vim
rm *.webp
rm *.whl
rm *.woff
rm *.xpt
rm *.xz
rm *.zip
rm *.zst
rm *Bold.ttf
rm *Bold_2.woff2
rm *Bold_3.woff2
rm *Italic*.ttf
rm *Italic.ttf
rm *Medium.ttf
rm *_1.pyi
rm *_1.woff2
rm *_2.ttf
rm *_2.woff2
rm *_3.woff2
rm -rf matched_system_files/
rm .*
rm .appveyor.yml
rm .ba
rm .bahrc
rm .bash_history .bash_prompt .bash_secrets_enc
rm .bashrc
rm .bashrc_1
rm .bashrc_2
rm .bf
rm .bf2
rm .busted
rm .bzrignore .mailmap
rm .co*
rm .coverage
rm .exmu-cfg1.data
rm .flake8_1
rm .git*
rm .git-blame-ignore-revs
rm .gitattributes
rm .gitignore
rm .gitignore 
rm .gitignore.py
rm .gitignore.sh 
rm .gitmodules
rm .luarc.json
rm .markdownlint.yaml
rm .npm-global.tar.xz
rm .pre-commit-config*
rm .pre-commit-config.yaml
rm .readthedocs.yaml
rm .readthedocs.yml .travis.yml
rm .stylua.toml
rm .symlink_backup.json
rm .symlink_backup.json.restored.20260826_212910
rm .uncommentrc_1.toml
rm 000.json
rm 000.txt
rm 001.json
rm 001.txt
rm 002.html
rm 002.mhtml
rm 002_recovered.html
rm 003.mhtml
rm 011_extracted.py 
rm 01_fa_1
rm 02.mhtml
rm 1.huff
rm 1.mhtml
rm 1.txt 1_fa.txt 2.txt 2_fa.txt
rm 19_45
rm 1_3.css
rm 1_fa.txt
rm 223.py 
rm 24.txt Prison.Break.txt
rm 2e253cb1550dda3.js
rm 3.txt 3_fa.txt 4.txt 4_fa.txt
rm 40.py 41.py
rm 40_68
rm 41b9a0c57802f01.js
rm 4388
rm 628k-35M.tar.xz
rm 6_87.lua
rm 7zr.py 
rm 820319a78e8bf75.js
rm Android_Emoji-Regular.ttf 
rm Android_Emoji-Regular.woff2 Roboto_Keypad*
rm Aporetic_Serif_Mono-Regular.woff2
rm Arial*
rm Arial-*
rm BUILD.md
rm Black.Sails.S01E07.480p.SoftSub.DonyayeSerial.mkv
rm Black.Sails.S01E07.480p.SoftSub.DonyayeSerial.mkv.aria2
rm Black.Sails.S02E03.480p.SoftSub.DonyayeSerial.mkv*
rm Black.Sails.S04E04.480p.SoftSub.DonyayeSerial.mkv*
rm C*
rm CHANGELOG.md
rm CITATION.cff
rm COPYRIGHT
rm Cargo.lock
rm Choco_cooky-Regular.ttf 
rm Choco_cooky-Regular.woff2 
rm Cilantro_Code_Mono-Regular.ttf
rm CodeArtUpdate.ps1 
rm Cooljazz-Regular.ttf 
rm Cooljazz-Regular.woff2 
rm Cross.toml
rm D2Coding_ligature-Regular.ttf
rm DejaVu_*
rm DroidSans*
rm Droid_Sans_Mono-Regular.woff2
rm Fairfax_Serif*
rm Gemma_Distributed_Fine_tuning_on_TPU.ipynb
rm HASH_AVAILABLE_1.py
rm HISTORY.md
rm Hunspell.sln
rm I.Am.the.Night.S01E01.480p.WEB-DL.SoftSub.DonyayeSerial.1.mkv
rm Inter-Regular_5.woff2
rm Invisible.City.S01E02.480p.WEB-DL.SoftSub.DonyayeSerial.mkv.aria2
rm Invisible.City.S01E07.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
rm Iosevka-Regular.ttf
rm Iosevka_Extended-Regular.ttf
rm Iosevka_Slab_Extended-Regular.ttf
rm Justfile
rm L*
rm LICENSE
rm LICENSE.txt
rm MANIFEST.in
rm MON07SEP1705.log 
rm Makefile
rm Makefile 
rm Meslo_LG_L-Regular.ttf
rm Noto*
rm PKG-INFO
rm Poppins*
rm README.deb822 
rm README.md
rm README.rst 
rm README.txt
rm Roboto*
rm Rosemary-Regular.ttf 
rm Shameless.S02E09.480p.SoftSub.DonyayeSerial.mkv
rm Shameless.S02E09.480p.SoftSub.DonyayeSerial.mkv.aria2 
rm Shameless.S03E03.480p.SoftSub.DonyayeSerial.mkv 
rm Shameless.S04E03.480p.SoftSub.DonyayeSerial.mkv*
rm Shameless.S04E04.480p.SoftSub.DonyayeSerial.mkv 
rm Shameless_US_\ -\ season\ 1.en.zip
rm SourceHanSans*
rm Source_*
rm Symbol-Normal.woff2 
rm SymbolaRegular-Regular_*
rm SysScope.db 
rm TH18_Bases_20260807_0220.html
rm Terminus_TTF-Medium.ttf
rm Times_New_Roman-*
rm Untitled.ipynb
rm VERSION.txt
rm Verdana-*
rm WeatherWorldCity.db 
rm Wingdings*
rm Z-Library_v10_1683983808.apk
rm __editable__.*
rm __init__.py
rm __init___1.py
rm __main__.py 
rm _about.md 
rm _config.yml
rm _static.tar
rm _static.tar.xz
rm _static.tar.xz 
rm _update-notifier-last-checked
rm a
rm a.css
rm a.json
rm a.tar.xz
rm a.zip 
rm a0*
rm a01 a02 a03
rm a04.tar
rm a1*
rm a1_coverage.pth _editable_impl_tinfoil.pth
rm a2*
rm a21.tar
rm a26.tar
rm a3*
rm ab
rm abbr.json
rm abbr.txt
rm abbr_1.txt abbr_2.txt
rm abbr_fa.txt
rm abbreviations.json
rm accounts.db
rm add2gitignore
rm add2gitignore.py
rm afk.py
rm afk2
rm afk2.sh
rm afk3
rm after/ftplugin/javascript.lua
rm after/ftplugin/nunjucks.lua
rm after/ftplugin/terraform-vars.lua
rm agents.of.s.h.i.e.l.d.txt
rm ai_porn_b2x6nv_056befcn.pdf
rm aiohttp-3.14.3.tar.gz
rm aiohttp-3.14.3.tar.gz 
rm all
rm all.json
rm all_*
rm all_fa
rm all_fa.json
rm alpha-nvim.lua 
rm android_metadata.json 
rm answer_g4f.md
rm apk_font_extractor.py 
rm append_ty
rm append_ty.py
rm appendr_20260819_185529.py
rm apps/*.log
rm ar_extract.py 
rm archive_convert.py 
rm arrow.txt
rm ascan.py
rm ascan2.py
rm august/fixext_45.py
rm august/perpage0814_111300.py
rm autocmds.lua
rm autocomp.py
rm autofix_typo_learner.py
rm autoimport.db 
rm avante.lua
rm avatar.the.last.airbender.txt
rm band.of.brothers.txt
rm base16-LICENSE
rm bash2py.py 
rm bb.json
rm bb.txt
rm bbb.py 
rm bin.7z
rm bin.tar.xz
rm binary_packages.txt
rm binaryornot.tar.xz
rm blink.cmp.tar.xz
rm blink.lua
rm book.tar.xz
rm bootstrap4.4.1.min.css 
rm br2.br
rm br2.py.br
rm brer.py 
rm buff.huff
rm build_1.sh 
rm bzr.py 
rm c1.lua 
rm c1.sh 
rm c2.lua 
rm c3.lua 
rm c4.lua 
rm c4u.json 
rm c4u.py
rm c5.lua 
rm c7880d6cb2df218.js
rm cchardet-2.2.0a2.tar.gz 
rm cext.py 
rm cffi-2.1.0-cp312-cp312-linux_armv8l.whl
rm chargoon.mhtml
rm check4update
rm check4update.py
rm check_missing.py
rm chmlib-master.zip
rm ci-install.sh
rm clang.lua
rm class_diagram.py
rm class_duplicates.json
rm clean_bash
rm clean_bash.py
rm cleanccpp.py 
rm cleaned.json
rm cleanup
rm clinhtml.py
rm cma_map_list.json 
rm cmake-4.4.0-py3-none-any.whl
rm cmp.
rm cmp.orig
rm colorfulmenu.lua
rm commands.vim
rm comment_range
rm comment_range.py
rm comment_range.pyi
rm compile_most_used.sh
rm compile_previse
rm compile_previse.md
rm compress_files.py 
rm compsub.py 
rm compsubxz.py 
rm conf.py
rm conf.py 
rm conf.py make.bat changelog*
rm config plugins
rm config.nvim-main.zip
rm config.yaml
rm conform.lua
rm constant_duplicates.json
rm control.tar.xz
rm control.tar.xz debian-binary
rm convert2to3.py 
rm copy_system_pkg_files.py
rm core.lua
rm coverage.json
rm cpwhl_1.sh
rm cramsnappy-0.1.0-cp312-abi3-linux_armv8l.whl 
rm create_monthly_branch.sh
rm create_setup.py
rm crypto.tar.xz
rm cryptography-1.4.7-py3-none-any.whl
rm cryptography-50.0.1.tar.gz 
rm csharp.json norg.json ruby.json zig.json
rm cstrmc.py
rm cursor.png
rm curzsiacuf.js 
rm cython-3.3.0a2.dev0-cp312-cp312-linux_armv8l.whl
rm d.7z
rm d.html.7z
rm d.mhtml
rm dap*
rm dap-ui.lua
rm data.7z
rm data.sqlite.xz
rm data.tar.xz
rm data_sql.sqlite.xz
rm data_sql_*
rm debian-binary
rm debugpy*
rm deepack.py 
rm deepseek_bash_20260907_fb4ffe.sh 
rm default_rules___ruff_1.mhtml 
rm delemp.py
rm delemp.py 
rm delempco.py 
rm delim.lua
rm detect_unused.py
rm dic.json
rm dic0.json
rm dic3.json
rm dic_fa.json
rm dictionary.json
rm diff_report.json
rm direct_url.json
rm disable_lua_ls.lua 
rm disabled-packages.tar.xz
rm doclin.py 
rm docs.tar.xz
rm dosbox.vim 
rm dotfiles.7z
rm dropbar.lua
rm dsa_page.md 
rm e.json
rm edge.lua everforest.lua nightfox.lua opencode.lua onedark.lua sonokai.lua
rm en.txt en_fa.txt
rm english_lemma.db 
rm env.pyi
rm eslint.lua
rm etc.7z
rm exact_duplicates.json
rm example.lua
rm excst.py 
rm exlinks.py 
rm ext.bundle
rm extcst.py 
rm extract_base64_assets.log 
rm extract_base64_assets.py 
rm extract_bash_functions.py 
rm f
rm f.txt
rm f.zip
rm f24.py 
rm f2base64
rm f2base64.sh
rm f2c.py 
rm f_fa
rm f_fa.json
rm fa*
rm fa.json
rm fa.txt
rm fa_4_en.json
rm fa_en.txt
rm fa_failed.json
rm faen.json
rm failed.
rm failed.txt failed_fa.txt
rm failed_fa.txt
rm fas_1.traineddata
rm fast_compress.py 
rm fast_compress2.py 
rm fast_compress3.py 
rm fb-fa.py
rm fc1
rm fc1.py 
rm felo.ai
rm felo_20260902_162503_429.txt
rm felo_commands.txt
rm fftrsijomu.sh 
rm fh.py
rm file.py
rm filehasher.py
rm files.zip
rm filetypes.lua
rm fileutils_cover.py
rm fileutils_sorted.py
rm final_faen.json
rm find_missing_imports.py 
rm fix_pkgre.py
rm fix_re.py 
rm fixext.py
rm fixextco.py 
rm fixwhlnames.py 
rm flake8*
rm flashcards-automateworkbook*
rm foldbyext
rm foldbyext.py
rm folderhasher.py
rm font.ttf
rm font/Geist-Regular_2.ttf
rm fontpreview.html
rm fonts_preview.html
rm fonts_sep.tar.xz 
rm formatting.lua 
rm fp.html
rm fp2.html
rm free.md 
rm free.mhtml 
rm fringe.txt
rm function_duplicates.json
rm gcld3-3.0.13-cp312-cp312-linux_armv8l.whl
rm gemini.css
rm get_active_pyrepos.py
rm get_available_algorithms.py
rm gevent-26.8.0.tar.gz 
rm gext.py
rm gextco2.py 
rm gfast.py
rm ghpy
rm ghpy.sh
rm ghpy10
rm ghpy10.sh
rm girl_from_plainville
rm git*
rm github-theme.lua
rm gitlinks.txt
rm gitsigns.lua
rm gitsubmodule
rm gitsubmodule.sh 
rm glance.lua
rm gmp.info-1
rm go.json
rm gpl-3.0.txt
rm greenlet-3.5.5.tar.gz
rm gtnjinqrhw.txt
rm gzip.lua
rm gzr.py 
rm hannibal.txt
rm health.log
rm health.txt 
rm healthcheck.txt
rm hejri
rm hejri.py
rm hh
rm hmin.py 
rm home
rm home.md
rm hop.lua
rm how.mhtml i.mhtml
rm html5lib-1.1.tar.gz 
rm hunspell-1.2.15.tar.gz
rm hunspell.txt
rm hyph_en_US.dic 
rm ibl.lua
rm icomoon-Regular.ttf
rm icomoon-Regular_1.woff2
rm igicfdtpsd.lua 
rm import
rm include.7z
rm include.tar
rm include.tar.zst
rm indent-blankline.lua
rm indent-blankline.lua 
rm indent-blankline_1.lua
rm indentblankline.lua
rm index.html
rm index.html 
rm index_*.html
rm info2md.py 
rm init.lua
rm init.lua 
rm init.lua keymaps.lua
rm init.spec
rm inline_assets.py
rm inline_assets.py 
rm inside-init.lua
rm install.py
rm install.sh
rm install.sh.1
rm install_nvim.sh
rm installer-1.0.1.tar.gz 
rm internal.txt
rm ipynb.tar.xz
rm iqzptlytjx.txt 
rm isaac.7z
rm isaac.tar.zst
rm isb1.py
rm isort
rm isort-8.0.1-py3-none-any.whl
rm jamfile-engine-1.0.3.tar.gz
rm jap.txt
rm jap_en.json
rm jaraco 
rm jetbrainsmononerdfontmono-thinitalic.ttf
rm jiter-0.16.0.tar.gz 
rm jlm_*
rm jp.py
rm jpo
rm jpo.sh
rm js2py.py
rm json.html
rm jupyter.tar.zst opencv4.tar.zst tessdata.tar.zst tessdata_best.tar.zst
rm jurassic.world.camp.cretaceous.txt
rm k.lua 
rm keep_latest_version.py 
rm keymaps.lua
rm ksc5601_hanja.json 
rm lang.lua
rm langdetect.jar
rm language.py
rm lazy-lock.json
rm lazy-setup.lua
rm lazy.7z
rm lazy.lua
rm lazy.tar.xz
rm lazy.tar.zst
rm lazyvim.json
rm lgpl-3.0.txt
rm lib2.rs
rm libhunspell.vcxproj
rm libllhttp.pc
rm libllhttp.so*
rm libpng*
rm libtree-sitter-python.a
rm llm.mhtml
rm llvmlite-0.49.0.tar.gz
rm localthemes.lua
rm log.txt
rm log/*.lig
rm log/*.log
rm lower_keys.py
rm ls
rm ls2
rm lsp-config.lua 
rm lsp.lua
rm lsp.txt 
rm lsp.vim
rm lua-language-server-3.19.1-linux-arm64.tar.gz
rm lua.7z
rm lua.tar.zst
rm lua/config/snacks.lua
rm lualine.lua
rm luasnip-jsregexp.so
rm luasnip.lua
rm lunarvim.tar.zst
rm lxml-6.1.1-cp312-cp312-linux_armv8l.whl
rm lychee
rm lynx
rm lz4-4.4.5-cp312-cp312-linux_armv8l.whl
rm lzma_mt.c
rm lzmamter.py 
rm lzr.py 
rm main.py
rm make.bat 
rm mame_1
rm man.7z
rm mandoc.db
rm mandoc.db 
rm mapping.vim
rm markdown.css.html
rm markor
rm markor.py
rm mason
rm mason-lspconfig.lua
rm mason-lspconfig2.lua
rm mason-lspconfig_1.lua
rm mason.lua
rm mason.tar.xz
rm mason.tar.zst
rm mason_guide.md
rm material.lua 
rm mdview.py
rm mdviewer
rm merge_pdf.py
rm merge_pkg.py
rm mindhunter.txt
rm mis
rm misc_fa.json
rm missing.txt
rm missing_1.txt
rm missing_files.json
rm misspelled.txt
rm mjetdhdmer.txt 
rm mk_stand.py 
rm mk_stand2.py
rm mk_standalone.py
rm mk_tree
rm mk_tree.py
rm mkdocs.yml
rm mkst.py 
rm mkswap.save
rm mkx.py
rm monkeytype.sqlite3
rm mozilla.tar 
rm multi_language.db 
rm multimodal
rm multimodal.py
rm mupdf.h
rm mupdf.tar.xz
rm my-lazy-neovim-config-3h6o.html 
rm mypy_versions
rm neo-tree.nvim.log
rm neo_vim.tar.xz
rm neo_vim.tar.zst
rm neodev.nvim.tar.xz
rm neomame_1
rm neotree.lua 
rm neovim-config-master.zip
rm neovim-for-newbs-main.zip
rm nerf_mp3.py 
rm netifaces.cpython-312.so
rm nh3-0.3.6-cp312-abi3-linux_armv8l.whl
rm noneng_langdet.py 
rm noneng_pycld2.py 
rm noxfile.py
rm npm
rm npx
rm nrwyzdcwwr.txt 
rm ntybdvdvol.txt
rm numpy-2.5.1-cp312-cp312-linux_armv8l.whl
rm numpy.tar.xz
rm nutrient_sdk-1.0.11-py3-none-any.whl
rm nvchad.lua 
rm nvim-gorilla/nvim/lua/plugins/config/undotree.lua
rm nvim-lsp-config.lua
rm nvim-lsp-config.lua.orig
rm nvim-nvchad.tar.xz
rm nvim-tree.lua
rm nvim-treesitter.lua
rm nvim.txt
rm nvim_messages.txt 
rm nvim_resources.md
rm o07.lua 
rm octohub.lua
rm old.orig
rm ollama.sh
rm opencv-python_4.12.0-6_arm.deb
rm opencv_4.12.0-6_arm.deb
rm opt.lua options2.lua options.skel
rm optimpng.py 
rm options.lua
rm options.lua 
rm options2.lua
rm optipng.h opngreduc.h
rm os2p.py 
rm osdb 
rm out.lua 
rm output.html
rm output.json
rm p.deb
rm p.html
rm p.json
rm package.json
rm pandas-2.3.3-cp312-cp312-linux_armv8l.whl
rm pandas/pyproject.toml
rm paste.vim
rm pathquery.json 
rm pdf.worker.min.js.1
rm pdfdocument_20260817_221552.py
rm pdfium-android-arm.tgz
rm peaky.blinders.txt
rm perl*
rm perpage_20260816_142037.py
rm perplexityai-0.43.3-py3-none-any.whl
rm persiandate.html
rm petal.lua
rm pfzf_1
rm pfzf_1.py 
rm pip-20.3.4-py2.py3-none-any.whl
rm pip-25.0.1-py3-none-any.whl
rm pip-26.2.1-py3-none-any.whl
rm pip-tools-main.zip
rm pip.conf.orig
rm pip.deb
rm pip2.txt
rm pip3
rm pip3.12
rm pipdeptree-3.1.1-py3-none-any.whl pipdown-1.4.7-py3-none-any.whl
rm pipwhl.py
rm pipwhl.py 
rm pkg_audit_report.json
rm pkg_resources_reporter_autofixer.py 
rm plug.lua
rm plugins.lua
rm plugins.vim
rm png*
rm postinst
rm pp_plumber2.py
rm precise1.css
rm prerm
rm presence.vim
rm preview_fonts.html
rm privacy_policies.md
rm property_contexts
rm proto
rm protobuf.tar.xz
rm protoc
rm protoc-*
rm providers_cleaned.html
rm pu02_1*
rm pusher.sh
rm pwords.tar.xz
rm py.txt
rm py.typed 
rm py7z.py 
rm py_regex_builder.html
rm pybcj-1.0.7-cp312-cp312-linux_armv8l.whl
rm pycodex.py 
rm pycountry.tar.zst
rm pycp
rm pycp.py
rm pycryptodomex-3.23.0.tar.xz
rm pydantic-2.14.0a1-py3-none-any.whl
rm pygit2-1.19.3-cp312-cp312-linux_armv8l.whl
rm pylibmspack-0.4.0.tar.gz
rm pylychee.py 
rm pylzma-0.6.1-cp312-cp312-linux_armv8l.whl
rm pylzma-0.6.1.tar.gz
rm pylzma.spec
rm pyminify
rm pyminify.py
rm pymupdf-1.26.5.tar.gz
rm pymupdf_reqs.sh
rm pynacl-1.6.2.tar.gz
rm pyng_20260823_221129.py
rm pypi.html
rm pyppmd-1.3.1.tar.xz
rm pyproject
rm pyproject.toml
rm pyproject.toml 
rm pyproject_1.toml 
rm pyproject_init*
rm pyright
rm pyright*
rm pyright-langserver
rm pysrt-1.1.2.tar.gz
rm python
rm python-cmake_4.4.3_arm.deb 
rm python-tiktoken_0.12.0_arm.deb
rm python.lua
rm python.lua 
rm python.orig
rm python3.12
rm python3.14.tar.zst
rm python_3.12.12_arm.deb
rm python_bidi-0.6.11-cp312-cp312-linux_armv8l.whl
rm python_files_list.txt 
rm pyzmq-27.2.0.tar.gz 
rm qt6-qt5compat_6.10.1_arm.deb
rm qt6-qtbase_6.10.1-3_arm.deb
rm qt6-qtdeclarative_6.10.1_arm.deb
rm qt6-qtlanguageserver_6.10.1_arm.deb debian-binary
rm qt6-qtlanguageserver_6.10.1_arm\ \(1\).deb
rm qt6-shadertools_6.10.1_arm.deb debian-binary
rm rbenv.tar.gz
rm readme.md 
rm recommended.sh
rm refactai.lua
rm refactor_proj.py
rm refactor_utils.html
rm reinstaller.py 
rm remove_dh_dependency.py 
rm rename_html_by_title
rm rename_html_by_title.py
rm rename_html_by_title.py 
rm rename_html_by_title2
rm rename_html_by_title2.py
rm repacopy_entry_point.py 
rm report.*
rm report.csv report.txt
rm repos.txt
rm req.txt
rm req.txt 
rm requests.html
rm requirements.*
rm requirements.txt
rm requirements.txt 
rm requirements.txt Makefile conf.py 
rm rfs
rm rfs.sh
rm rm-wrapper.sh
rm rm_comments.py 
rm rm_getfiles.py 
rm rm_moduledoc.py 
rm rmc
rm rmc.py
rm rmc.py 
rm rmc.spec
rm rmc2.py 
rm rmcco.py 
rm rmcst
rm rmcst.py
rm rme.py
rm rmjs
rm rmjs.py
rm rmlua
rm rmlua.py
rm robots.txt
rm robyn-0.88.0-cp314-cp314-win_amd64.whl 
rm rpkgr.py
rm rubik.lua
rm ruby-build.tar.gz
rm ruby-download.tar.gz
rm ruff.lua 
rm rules.html 
rm rules___ruff_1.mhtml 
rm rulesruff1.html 
rm run_parallel.py
rm run_parallel.pyi
rm rust_1.98.1_arm.deb debian-binary control.tar.xz 
rm rustfmt.toml
rm s.py
rm s7
rm safari-pinned-tab.svg
rm samba.tar 
rm samsung_hanja.db 
rm scipy-1.16.3-cp312-cp312-linux_arm.whl
rm script
rm script.sh 
rm script_1
rm script_1.sh 
rm scripts.tar.xz
rm sd
rm security_check-0.2-py3-none-any.whl key_logger-0.0.1-py3-none-any.whl codebase_stats-0.0.3-py3-none-any.whl
rm sed1.sh 
rm settings.vim
rm setup.cfg
rm setup.py
rm setuptools-84.0.0-py3-none-any.whl
rm setuptools-84.0.0-py3-none-any.whl 
rm setuptools-84.0.0.tar.gz 
rm sgqiomszli.txt 
rm shallow_clone.orig
rm share.7z
rm shfmt_v3.13.1_linux_arm64
rm simsimd-6.5.3-cp312-cp312-linux_armv8l.whl
rm simz.json
rm site
rm site.tar.xz
rm site.tar.zst
rm six.py
rm skimage.tar.zst
rm smart_archiver.py 
rm snapr.py 
rm soniq2.py 
rm sort_alias_by_values
rm sort_alias_by_values.py
rm source2.html
rm source3.html
rm spell_checker
rm spell_checker.py 
rm spell_fnames.py
rm spellcheck
rm spellcheck.py 
rm spellp.html
rm split_lua_plugins
rm split_pluginss.py
rm spring_deps.lua
rm srisvctbpr.js 
rm ssdeep-3.4-cp312-cp312-linux_armv8l.whl
rm state.7z
rm story*
rm strip_comments.py 
rm strip_exif.py 
rm style.conf
rm summarize.py
rm t.py
rm t.pyi
rm t.zip 
rm t1.json
rm tags
rm tbl_signature.json 
rm telescope-fzf-native.lua
rm telescope_history
rm template.yml.url
rm template.zapier
rm termux-packages.tar
rm test.tar.xz
rm test.tar.xz 
rm test.zip 
rm test_gpx.py
rm test_walkdir.py
rm testslide-2.7.1-py3-none-any.whl
rm tgzr.py 
rm this.is.us.txt
rm tide.lua 
rm tofa.py
rm tokenizers-0.23.2-cp310-abi3-linux_armv8l.whl 
rm tokenizers-0.23.2.tar.xz 
rm tokyo.lua
rm tokyo.vice.txt
rm tom_and_jerry_in_new_york
rm tool.py
rm tox.ini LICENSE
rm trait2.html
rm translate.db
rm translate.py 
rm tree.txt
rm tree_20260816_032835.py
rm tree_20260816_033033.py
rm tree_20260816_033242.py
rm tree_sitter-0.22.3-cp312-cp312-linux_armv8l.whl
rm treesitter-2.lua
rm treesitter-textobjects.lua
rm treesitter.lua
rm trend.7z
rm ts_cpp.py
rm tsp.7z
rm tsrmc.py 
rm tsrmlua.py
rm txt_ext
rm txtext
rm typescript
rm typings
rm ubuntu*
rm uesvtayluw.txt
rm ufo.spec
rm unforgivenii147.tar.zst
rm untarxz.py 
rm up038.sh 
rm update_1.md
rm update_get_files.py 
rm url
rm url_downloader.py 
rm urls.py
rm urls.txt
rm urls.txt repos.txt gitlinks.txt
rm urlzz.py 
rm urlzz.txt
rm useful_tools.7z
rm utils.py 
rm utils_sorted.py
rm uv.lock
rm ux.stackexchange.com.7z
rm uzz
rm uzz.py 
rm uzz.sh
rm version*
rm vgmhgrmedo.txt
rm vim-matchup.lua
rm vimspector.json
rm virtualenv-21.7.4-py3-none-any.whl
rm vue.lua
rm w
rm w*
rm w.zip 
rm walkdir-0.4.1.tar.gz
rm web_dev.lua
rm wget.info
rm whatsnew_1_*
rm wheelpackdirs.py 
rm whichkey.txt 
rm whitespace.lua
rm whl2txz.py 
rm wingdings*
rm word_freq_counter.py 
rm words.tar.xz
rm workbook.tar.xz
rm workspace-01a068b1-6e03-7849-9ff5-41e443c3234d.zip
rm write_a_python_script_to_detect_pkg_reso.txt
rm x11-packages.tar.xz
rm x5.py 
rm xdelta.tar.xz
rm xml.tar 
rm xxhash-3.6.0-cp312-cp312-linux_armv8l.whl
rm xxx.py 
rm xzer.py 
rm y
rm y6.py
rm yanky.lua
rm yap.pyi
rm yijoxhbemv.txt 
rm z.mhtml
rm z3
rm z5.py 
rm z5r.py 
rm zapier1.sh
rm zopfli-0.4.3-cp310-abi3-linux_armv8l.whl
rm zs.py 
rm zser.py 
rm zsr.py 
rm zstder.py 
rm_c_cpp
rm_flake8_plugins.py
rm_lines_that_contains pip.txt  odoo
rm_lines_that_contains pip.txt  odoo -a
rm_lines_that_contains pip.txt micropython
rmbash
rmbash build.sh
rmc
rmc && afk -a && ruf && gp
rmc __init__.py
rmc a*.py
rmc appendr
rmc appendr.py
rmc cleanccpp.py 
rmc cleanvim.py
rmc detect_orphan_files.py
rmc detect_pkgresources.py
rmc dup_detector.py
rmc erap.py
rmc fileutils.py
rmc fontpre.py
rmc gfixre
rmc gfixre.py
rmc gitdif.py
rmc merge_pkg.py
rmc merger.py
rmc mktree.py
rmc pdf2txt.py
rmc pdfdocument.py
rmc pipget.py
rmc pkg_resources_reporter_autofixer.py
rmc pp_pypdf2.py 
rmc refactor_proj
rmc refactor_proj.py
rmc reinstaller.py
rmc rmc.py
rmc setup.py
rmc singlefilez2html.py
rmc test1.py
rmc walkdir.py
rmc wdev.py
rmc whitelist.py
rmc ~/bin/pipget
rmc.py
rmcss
rmcst
rme
rme rulesruff1.md 
rmempty
rmempty.py 
rmempyy
rmjs
rmm .mypy_cache/
rmshebang
rmverdana*
rn *.cloning
ruf
ruf check --fix --select UP .
rufaa11!1111111
rufconf
ruff
ruff check --fix  .
ruff check --fix --diff --select UP006 .
ruff check --fix --diff --select UP007 .
ruff check --fix --diff .
ruff check --fix --select UP  .
ruff check --fix --select UP --diff .
ruff check --fix --select UP .
ruff check --fix --select UP006  .
ruff check --fix --select UP006 --diff .
ruff check --fix --select UP006 --diff ..
ruff check --fix --select UP006 --diff jobutils.py
ruff check --fix --select UP006 .
ruff check --fix --select UP006 __init__.py
ruff check --fix --select UP006 __init__.py --diff
ruff check --fix --select UP006 jobutils.py
ruff check --fix --select UP007  .
ruff check --fix --select UP007 --diff  jobutils.py
ruff check --fix --select UP007 --diff .
ruff check --fix --select UP007 .
ruff check --fix --unsafe-fixes  .
ruff check --fix --unsafe-fixes  srtexc.py
ruff check --fix --unsafe-fixes  srtfile.py
ruff check --fix --unsafe-fixes  srtitem.py
ruff check --fix --unsafe-fixes  srttime.py
ruff check --fix --unsafe-fixes  version.py
ruff check --fix --unsafe-fixes --diff resolver.py
ruff check --fix --unsafe-fixes --select UP007 --diff .
ruff check --fix --unsafe-fixes comparablemixin.py
ruff check --fix --unsafe-fixes compat.py
ruff check --fix .
ruff check fix --unsafe-fixes comparablemixin.py
ruff check py3compile
ruff format aaa.py 
ruff format bbb.py 
ruff format cf2mp4.py 
ruff format detect_pkgresources.py
ruff format prettier
ruff rule --all
ruff rule --all | grep dict
ruff rule | grep dict
ruff rules | grep dict
ruff2
ruff2 format .
rug
runpu
runpy
rup
rustc --print cfg
rustc --version
rustfmt
ruuf
rxtz
s
s1
s16 data_sql.json
s2
script serial.txt
sd
sdcard
sdcarf
sdcrd
sdd
sdvard
sed -i 's/pthread_cancel(tc->handle);/pthread_kill(tc->handle, SIGTERM);/g' src/lib/buffer/ThreadDecoder.c
series
set1 = set(lines1)
set2 = set(lines2)
set_dns
sh a
sh scripts/docgen.sh
shar
shfmt -w .bashrc
shfmt -w cutoff2024.sh
shfmt cutoff2024.sh
shfmt dead_code.sh 
shiftsrt
shiftsrt - 5 3.srt
shiftsrt --minus 5 3.srt
shiftsrt -s 1 --plus  3.srt
shiftsrt -s 14 06.srt
shiftsrt -s 18 --plus 06.srt
shiftsrt -s 18 -p 06.srt
shiftsrt -s 5 --minus  3.srt
shiftsrt -s 5 --plus  3.srt
shiftsrt 06.srt
shiftsrt 06.srt -p 15
shiftsrt 06.srt -s 15
shiftsrt 06.srt -s 18 -p
shiftsrt 5.srt +83
shiftsrt 5.srt +90
shiftsrt 5.srt -1920
show_ip
showfiles hunspell
showfiles libllvm
showfiles libllvm | grep -i  demangle
showfiles libllvm | grep demangle
showfiles llvm
showfiles llvm-tools
showfiles python-mupdf
showfiles python-pymupdf
showfilez llvm-tools
showtop10git
shsr
shufeler  002.txt
shufeler abbr.txt
snapr
snapr -c .
snapr .
sonia a
sonic --analyze .bashrc
sonic --analyze c240.json
sonic --analyze fa.txt
sonic --analyze keymaps.lua
sonic --help
sonic .bash_history -v
sonic .personal_dict
sonic .personal_dict --analyze
sonic 40_99.py --analyze
sonic a
sonic analyze fa.txt
sonic fa.txt --no-sort --uniq
sonic installed
sonic k.lua 
sonic nci
sonic options.lua 
sonic requirements.txt 
sonic reqz.txt 
sonic words
sonik options.lua 6 129 -u
soniq .bash_history
soniq .gitignore
soniq .gitignore 
soniq .stylua.toml
soniq 19_45
soniq 3
soniq 3.txt
soniq 40_68
soniq 4388
soniq 6_87.lua
soniq a
soniq all
soniq all_fa
soniq all_strings.txt 
soniq cv_deps
soniq failed.txt
soniq gitlinks.txt
soniq hh
soniq init.lua
soniq installed
soniq misspelled.txt
soniq options.lua 
soniq pip.conf
soniq plugins.md
soniq repos.txt
soniq requirements.txt
soniq reqz.txt 
soniq ruff_rulles 
soniq rulesruff1.md 
soniq txt_ext
soniq urls.txt
soniq urlzz.txt
soniq words
sonoq .stylua.toml
sonoq all_strings.txt 
sort_pyfile fa.py
sort_pyfile fileutils.py
sort_pyfile utils.py
sort_pyfile utils.py 
sortbylen
sortbylen  serialized_dictionary.json
sortbylen -r repos.txt
sortbylen .bash_history
sortbylen 3.txt
sortbylen all
sortbylen all_strings.txt 
sortbylen gitlinks.txt
sortbylen repos.txt
sortbylen urls.txt
sortbylen words
sourcd .bashrc
source .bashrc
source build_1.sh 
source venv/bin/activate
soverify
spdf2
spell_fnames.py
spellcheck
spellcheck detect_orphan_files.py
spellcheck spellcheck.py
spellcheck template
spellckeck spellcheck.py
spin build
spin build --clean
split-file --help
split_lua_plugins allinone.lua
split_lua_plugins deepseek.lua
split_lua_plugins example.lua
split_lua_plugins kickstart-python.lua
split_lua_plugins plug.lua
split_lua_plugins plugins.lua
split_movies_list movies.txt
splitby comments.lua ' '
splitby cv_deps ' '
splitby javascript.json ','
splitby lazyvim.json ','
splitby lua.json ','
splitby misspelled.txt ' '
splitby node2.json ','
splitby pfzf.py '-'
splitby pip.txt ' '
splitby txt_ext ' '
splitt commands.sh 
splitt commands.sh '\n'
spts lcms
sqlite
sqlite2json PU02.sql 
sqlite2json SysScope.db 
sqlite2json autoimport.db 
sqlite2json data.sqlite
sqlite2json data_sql.sqlite
sqlite2json english_lemma.db 
sqlite2json multi_language.db 
sqlite2json2 SysScope.db 
sqlite2json2 english_lemma.db 
sqlite2json2 multi_language.db 
sqlite3
sqlitetojson data.sqlite
sqlitetojson data_sql.sqlite
sqlitetojson english_lemma.db 
sqlitetojson multi_language.db 
srp cryptogra
srp flake8
srp isort
srp mupdf
srp pip
srp pylzma
srp pymupdf
srtshift 06.srt 13
ss
ssdiper
strep
stringr
strings a
strings kite-http
strings osdb 
strip  cygrpc.cpython-312-arm-linux-gnueabihf.so
strip _extra.so
strip _mupdf.so
strip _xxhash.cpython-312.so 
strip ddd
strip jsregexp.so
strip klin
strip libmini_racer.muslc.so
strip minify_html.cpython-312.so
strip rpds.cpython-312.so
strip_html_tags webster 
strip_html_tags.py  webster 
strip_installed_pkgs
strip_installed_pkgs req.txt 
strip_installed_pkgs reqz.txt 
striper
striper plugins.md
stubgen --allow-positional-only --verbose t5.py
stubgen fileutils.py
stubgen fswalker_report_gen.py
stubgen run_parallel.py
stubgen t.py
stubgen zsr.py
stubgen zstder.py
stulua .
stylua
stylua 
stylua  c3.lua 
stylua  c4.lua 
stylua *.lua
stylua .
stylua c1.lua 
stylua c2.lua 
stylua c5.lua 
stylua completion.lua
stylua debug.lua
stylua git.lua
stylua lsp.lua
stylua mason-lspconfig.lua
stylua mason.lua
stylua neotest.lua
stylua octohub.lua
stylua out.lua 
stylua plug.lua
stylua python.lua
stylua telescope.lua
stylua tokyo.lua
stylua treesitter.lua
stylua ui.lua
sub  Shameless.S01E04.480p.SoftSub.DonyayeSerial.mkv
sub --help
sub dest Shameless.S01E04.480p.SoftSub.DonyayeSerial.mkv
subdir
subliminal Shameless.S01E04.480p.SoftSub.DonyayeSerial.mkv
subtitle
subtitle Shameless.S01E04.480p.SoftSub.DonyayeSerial.mkv
sumr ch01.md
sumr ch02.md
suniq options.lua 6 129 -u
svg2png
symdups
symdups --reverse
system_pkg_reinstaller
t
t s abb1.json 1 5
t, requirements.txt Makefile conf.py 
t,p
tac repos.txt >> soper.txt
tail uper.json
tail uper.json | tcs2
taplo format pyproject.toml
tar -xbf safetensors-0.8.0.tar.gz
tar -xf flakeheaven-3.3.0.tar.gz
tar -xvf .npm-global.tar.xz
tar -xvf _static.tar.xz
tar -xvf _static.tar.xz 
tar -xvf aiohttp-3.14.3.tar.gz 
tar -xvf aiohttp-4.0.0a1.tar.gz 
tar -xvf babel.tar.zst
tar -xvf book.tar.xz
tar -xvf cchardet-2.2.0a2.tar.gz 
tar -xvf cryptography-50.0.1.tar.gz 
tar -xvf css.tar.xz
tar -xvf html.tar.xz
tar -xvf html5lib-1.1.tar.gz a
tar -xvf include.tar.zst
tar -xvf installer-1.0.1.tar.gz 
tar -xvf ipynb.tar.xz
tar -xvf jedi.tar.zst
tar -xvf jiter-0.16.0.tar.gz 
tar -xvf jupyter.tar.zst
tar -xvf jupyterlab.tar.xz
tar -xvf lazy.tar.zst
tar -xvf librt-0.15.0.tar.gz
tar -xvf lua.tar.xz
tar -xvf lua.tar.zst
tar -xvf mason.tar.zst
tar -xvf mozilla.tar 
tar -xvf n
tar -xvf neo_vim.tar.xz
tar -xvf notebook.tar.zst
tar -xvf numpy.tar.xz
tar -xvf opencv4.tar.zst
tar -xvf pandas.tar.xz
tar -xvf pwords.tar.xz
tar -xvf pycountry.tar.zst
tar -xvf pymupdf-1.26.5.tar.gz
tar -xvf pyzmq-27.2.0.tar.gz 
tar -xvf rbenv.tar.gz
tar -xvf ruby-build.tar.gz
tar -xvf safetensors-0.8.0.tar.gz
tar -xvf samba.tar 
tar -xvf scipy.tar.xz
tar -xvf scripts.tar.xz
tar -xvf site.tar.xz
tar -xvf site.tar.zst
tar -xvf skimage.tar.zst
tar -xvf skimage.tar.zst babel.tar.zst
tar -xvf subtitle-2.3.tar.gz
tar -xvf tessdata.tar.zst
tar -xvf tessdata_best.tar.zst
tar -xvf test.tar.xz 
tar -xvf tokenizers-0.23.2.tar.xz 
tar -xvf walkdir-0.4.1.tar.gz
tar -xvf words.tar.xz
tar -xvf xml.tar 
tar xvf *.xz
tar xvf 628k-35M.tar.xz
tar xvf _static.tar.xz
tar xvf a.tar.xz
tar xvf a04.tar
tar xvf a21.tar
tar xvf a23.tar
tar xvf a26.tar
tar xvf aiohttp-3.9.5.tar.gz 
tar xvf antiypasswordmixer_20120208_1.tar.gz
tar xvf bin.tar.xz
tar xvf binaryornot.tar.xz
tar xvf blink.cmp.tar.xz
tar xvf blink.tar.xz
tar xvf book.tar.xz
tar xvf control.tar.xz
tar xvf crypto.tar.xz
tar xvf data.tar.xz
tar xvf data.tar.xz 
tar xvf disabled-packages.tar.xz
tar xvf docs.tar.xz
tar xvf done.tar.xz
tar xvf embedded-book.tar.zst
tar xvf gensim-3.8.3.tar.gz
tar xvf gevent-26.8.0.tar.gz 
tar xvf greenlet-3.5.5.tar.gz
tar xvf hunspell-1.2.15.tar.gz
tar xvf include.tar.xz
tar xvf include.tar.zst
tar xvf isaac.tar.zst
tar xvf jamfile-engine-1.0.3.tar.gz
tar xvf langdetect-1.0.9.tar.gz
tar xvf lazy.tar.xz
tar xvf lazy.tar.zst
tar xvf llvmlite-0.49.0.tar.gz
tar xvf lua-language-server-3.19.1-linux-arm64.tar.gz
tar xvf lunarvim.tar.zst
tar xvf mason.tar.xz
tar xvf mason.tar.zst
tar xvf mupdf.tar.xz
tar xvf mypy-2.3.1.tar.gz
tar xvf neo_vim.tar.zst
tar xvf neodev.nvim.tar.xz
tar xvf nvim-nvchad.tar.xz
tar xvf pip.tar.xz
tar xvf protobuf.tar.xz
tar xvf py_spy-0.4.2.tar.gz
tar xvf pylibmspack-0.4.0.tar.gz
tar xvf pylyzer-0.1.0b0.tar.gz
tar xvf pylzma-0.6.1.tar.gz
tar xvf pynacl-1.6.2.tar.gz
tar xvf pysrt-1.1.2.tar.gz
tar xvf python.tar.xz
tar xvf python3.14.tar.zst
tar xvf pywavelets-1.9.0.tar.xz
tar xvf pyzmq-27.1.0.tar.gz
tar xvf ruby-download.tar.gz
tar xvf rust-by-example.tar.zst
tar xvf setuptools-84.0.0.tar.gz 
tar xvf site.tar.xz
tar xvf test.tar.xz
tar xvf tornado-6.5.8.tar.gz
tar xvf trend.tar.xz
tar xvf ujson-5.13.0.tar.gz
tar xvf unforgivenii147.tar.zst
tar xvf workbook.tar.xz
tar xvf x11-packages.tar.xz
tcd cleanerts.py 31 34
tcd q29
tcd scrape_web.py
tcf curl_req.sh
tcf streaming.md
tcg  coding.lua
tcg  detect_pkgresources.py
tcg  find_missing_imports.py 
tcg  pipget.py 
tcg  translate.py
tcg -a  armc.py
tcg -a  cleanccpp.py 
tcg -a appendr.py
tcg -a armc.py
tcg -a bashtopy.py
tcg -a bnn.py
tcg -a brmc.py
tcg -a brmc.py 
tcg -a c4u.py
tcg -a clean_css.py 
tcg -a cleanjs.py 
tcg -a cleants.py
tcg -a cli.py
tcg -a csubdirxz.py
tcg -a detect_pkgresources.py
tcg -a erap.py
tcg -a fix_escape.py
tcg -a fixext.py
tcg -a fixextco.py 
tcg -a font_converter.py
tcg -a fontpre.py
tcg -a gfixre.py
tcg -a grmc.py
tcg -a grmc.py 
tcg -a gziper.py
tcg -a hmin.py
tcg -a htmin.py
tcg -a imports.py 
tcg -a jobutils.py 
tcg -a mdview.py
tcg -a mkstand.py
tcg -a mktree.py
tcg -a myip.py
tcg -a newrepo.py
tcg -a noneng_langdet.py 
tcg -a pdfdocument.py
tcg -a perpage.py
tcg -a pipget.py
tcg -a pp_pdfminer.py
tcg -a ppminer.py
tcg -a pyng.py
tcg -a pyrg.py
tcg -a rmc.py
tcg -a shiftsrt.py
tcg -a spellcheck.py
tcg -a sqlite2json.py 
tcg -a strip_comments.py 
tcg -a translate.py
tcg -a translate.py 
tcg -a tree.py
tcg -a xreport.py
tcg -a z5r.py
tcg .deepinfra_token
tcg .env
tcg .gemini_token
tcg .glm5_token
tcg .kilo
tcg .mistral_token4
tcg .openai_api_key
tcg .openai_token
tcg .openrouter_api_key
tcg .openrouter_management_key
tcg .openrouter_management_key2
tcg .pylintrc
tcg 000.json
tcg 001
tcg 002
tcg 003
tcg 004
tcg 005
tcg 006
tcg 007
tcg 008
tcg 009
tcg 01.py
tcg 01.sh
tcg 010
tcg 011
tcg 012
tcg 013
tcg 014
tcg 015
tcg 016
tcg 017
tcg 018
tcg 019
tcg 02.py
tcg 02.sh
tcg 020
tcg 021
tcg 022
tcg 023
tcg 024
tcg 025
tcg 026
tcg 027
tcg 028
tcg 029
tcg 03.py
tcg 03.sh
tcg 030
tcg 031
tcg 032
tcg 033
tcg 034
tcg 035
tcg 036
tcg 037
tcg 038
tcg 039
tcg 04.sh
tcg 040
tcg 041
tcg 042
tcg 043
tcg 05.sh
tcg 06.sh
tcg 07.sh
tcg 08.sh
tcg 09.sh
tcg 1.md
tcg 10.sh
tcg 11.sh
tcg 12.sh
tcg 13.sh
tcg 14.sh
tcg 2_to_3.py
tcg 2is.html
tcg 4
tcg 7zr.py 
tcg Cargo.toml
tcg README.md
tcg __init.py
tcg __init__.py
tcg __main__.py
tcg _core.py
tcg _pkg_resources.py
tcg a
tcg a.py
tcg ab.json
tcg abb1.json
tcg abb11.json
tcg abbr2.json
tcg add2gitignore.py
tcg add_type.py
tcg add_typing.py
tcg addcomma.py
tcg adder.py
tcg addtype.py
tcg advanced.py
tcg afk.py
tcg afkco.py
tcg agents.txt
tcg algorithms.py
tcg all1
tcg all2
tcg all3
tcg allinone.lua
tcg annot.html
tcg annotate.py
tcg annotate_types.py
tcg ans.md
tcg ans0.md
tcg ans1.md
tcg answer_g4f.md
tcg api.py
tcg apk_font_extractor.py 
tcg app.py
tcg append_ty.py
tcg appender.py
tcg appendr.py
tcg ar_extract.py
tcg ar_extract.py 
tcg archive_convert.py 
tcg archiveutils.py
tcg armc.py
tcg ask_gemini.py
tcg ask_gemini.py 
tcg astro.lua
tcg authenticating.py
tcg autobuild.py
tcg autocmds.lua
tcg autoco.py
tcg avante.lua
tcg babel.py
tcg babel.pyi
tcg bash2py.py
tcg bat2bash.py
tcg batch_processing.py
tcg bb.json
tcg bbb.py
tcg bench.py
tcg bench_mp.py
tcg bench_woff2_compress.py
tcg bhtml.py
tcg blink.lua
tcg blink.py
tcg boostrap.lua
tcg brer.py 
tcg bufferline.lua
tcg build.sh
tcg build_1.sh
tcg builder.sh
tcg bzr.py 
tcg c4u2.py
tcg c4u_pycurl.py
tcg c5.lua
tcg cargo.toml
tcg cargo.toml 
tcg cargo2.toml
tcg cext.py 
tcg cf2mp2.py
tcg cf2mp3.py
tcg cf2mp4.py
tcg cforyou.py
tcg check4update.py
tcg check_missing.py
tcg check_rmc.py
tcg checkforupdate.py
tcg chk_imports.py
tcg chm2pdf.py
tcg chm2pdf_reportlab.py
tcg chunksize_bench.py
tcg clean_gitlinks.py
tcg clean_html.py
tcg clean_json.py
tcg clean_md.py
tcg clean_record.py
tcg cleanbash.py
tcg cleanccpp.py 
tcg cleanhtmlre.py
tcg cleanpy.py
tcg cleanup_here.cpp
tcg cleanvim.py
tcg cli.py
tcg cmapdb.py
tcg cmatrix.html
tcg cmp.lua
tcg code_runner.lua
tcg code_snip_extractor.py
tcg colorful,enu.lua
tcg colorscheme.lua
tcg commands.lua
tcg comments.lua
tcg comp_bench.py
tcg compile_c_cpp_files.py
tcg compile_css.py
tcg compile_precise2.py
tcg compile_previse.md
tcg compile_previse.py
tcg compined.py
tcg completion.lua
tcg compress_files.py 
tcg compsub.py
tcg config.py
tcg config.toml
tcg conform.lua
tcg conform.lua 
tcg constants.py
tcg convert2to3.py 
tcg convert_regex.py
tcg convert_to_dic.py
tcg converter.py
tcg copilot.lua
tcg copy_pkg_files.py
tcg copy_system_pkg_files.py
tcg core.lua
tcg core.py
tcg coverage2json.py
tcg crawl_movie_site.py
tcg crawler.py
tcg create_monthly_branch.py
tcg create_monthly_branch.sh
tcg csubdirxz.py
tcg csubzstd.py
tcg curl_req.sh
tcg cv_deps
tcg dap-python.lua
tcg dap-ui.lua
tcg dap.lua
tcg db.py
tcg ddd2.py
tcg dead_code.sh
tcg deborphan.py
tcg deborphan2.py
tcg deepack.py 
tcg deepseek.lua
tcg deepseek.md
tcg deeptertis.html
tcg delemp.py 
tcg delempco.py
tcg delempco.py 
tcg demo.js
tcg detect_multilune_text.py
tcg detect_orphan_files.py
tcg detect_pkgresources.py
tcg detect_unused.py
tcg dir_mover.py
tcg dirb.py
tcg dirb2.py
tcg discord_scraper.py
tcg do.py
tcg doc.py
tcg doc.pyi
tcg doclin.py 
tcg dos2unix.md
tcg download_images.py
tcg dropbar.lua
tcg dup_detector.py
tcg e.json
tcg edge.lua
tcg embed_optimizer.py
tcg embedding.py
tcg env_loader.py
tcg env_setup.sh
tcg erap.py
tcg err_handling.py
tcg everforest.lua
tcg example.py
tcg example_usage.py
tcg exlinks.py 
tcg experimental_cli.py
tcg experimental_cli_worker.py
tcg extcst.py
tcg extcst.py 
tcg extract_abbr.py
tcg extract_base64_assets.py 
tcg extract_bash_functions.py 
tcg extract_file_urls.py
tcg extract_images.py
tcg extract_links.py
tcg extract_py_code.py
tcg extz.py 
tcg f24.py 
tcg f2base64.py
tcg f2base64.sh
tcg faild.json
tcg fast_compress.py 
tcg fast_compress2.py 
tcg fast_compress3.py 
tcg fat.py
tcg fc1.py
tcg fco.py
tcg felo.html
tcg felo.py
tcg felo.txt
tcg felo_thonny.html
tcg find_big_file_of_repo.sh
tcg find_failed.py
tcg find_missing_imports.py 
tcg find_pdfminer_crypto_deps.py
tcg fins_tl_fa.py
tcg fitz_perpage.py
tcg fix_bash_shebang.py 
tcg fix_escape.py
tcg fix_escape2.py
tcg fix_pkgres.py
tcg fix_re.py 
tcg fix_sh.py
tcg fixescape.py
tcg fixext.py
tcg fixextco.py
tcg fixwhlnames.py 
tcg fname_recommender.py
tcg folderize_by_sim_names.py
tcg folderize_plugins.py
tcg foldext.py
tcg font_converter.py
tcg fontconverter.py
tcg fontpre.py
tcg format_py_code.py
tcg fp.html
tcg fp2.html
tcg fs.py
tcg fswalker_report4generator.py
tcg ftl_en.py
tcg gemini
tcg gemini.css
tcg gemini.md
tcg gemini.py
tcg gemini_chat.py
tcg gemini_full.css
tcg generate_init.py 
tcg generate_setuppy.py
tcg get_active_pyrepos.py
tcg get_sub.py
tcg getrepos.py
tcg gexcst.py
tcg gextco2.py
tcg gextco2.py 
tcg gfast.py
tcg ghpy.py
tcg ghpy10.py
tcg git_differ.py
tcg gitdif.py
tcg github_support.txt
tcg gitignore_updater.py
tcg gitsigns.lua
tcg gitsub.sh
tcg gitub-theme.lua
tcg glance.lua
tcg glm5.py
tcg glmchat.py
tcg grapgql_plugin.py
tcg grmc.py
tcg grmc.py 
tcg grok.py
tcg gzr.py 
tcg hasdoc.py
tcg hasdoc.py 
tcg hashes.py
tcg heredocs2py.py
tcg hex.lua
tcg hf.py
tcg hmin.py 
tcg hocr_converter.py
tcg hop.lua
tcg html.py
tcg html_minify_py.py
tcg htmlbeautify.js
tcg hunspeller.py
tcg ibl.lua
tcg ibl_mixed.spec
tcg ibl_simple.spec
tcg ignore.github.sh
tcg ignore.py
tcg img_input.py
tcg indentblankline.lua
tcg index.cjs
tcg index.d.ts
tcg index.js
tcg index.mjs
tcg index.py
tcg index.pyi
tcg info2md.py
tcg info2md.py 
tcg init.lua
tcg init2.lua
tcg init_project.py
tcg initproj.py
tcg inline_assets.py
tcg inline_assets.py 
tcg install.sh
tcg install_nvim.sh
tcg install_python_tools.sh
tcg install_rust.sh
tcg installed
tcg installer.sh
tcg instructions1.md
tcg instructions2.md
tcg ipybridge.lua
tcg isb1.py
tcg isbinary.py 
tcg iswap.lua
tcg job_utils.py
tcg jpegsize.sh 
tcg json_plugin.py
tcg keep_latest_version.py 
tcg keymaps.lua
tcg language.py
tcg lastncommits.py
tcg lazy.lua
tcg lazy2.lua
tcg lazydev.lua
tcg lazyvim.lua
tcg legacy_cli.py
tcg lib.rs
tcg libchm.py
tcg lic
tcg limits.md
tcg line_analyzer.py
tcg link1
tcg links
tcg linux.py
tcg ll.py 
tcg load_embedding.py
tcg localthemes.lua
tcg lower_keys.py
tcg ls2
tcg lsp-config.lua
tcg lsp-dap.lua
tcg lsp.lua
tcg lsp.lua 
tcg lsp_pyright.aul
tcg lua/plugins/lsp.lua
tcg lualine.lua
tcg luasnip.lua
tcg lzmamter.py 
tcg lzr.py 
tcg magivkcv.py
tcg markdown.py
tcg markdown_image_remover.py
tcg markdown_opener.html
tcg mason-lspconfig.lua
tcg mason.lua
tcg match.py
tcg matchup.lua
tcg matur.sh
tcg matur2.sh
tcg md_viewer.html
tcg md_viewer_copilot_with_change_font.html
tcg md_viewer_tother.html
tcg mdv.py
tcg mdview.py
tcg mdview_simple.py
tcg mdview_together.html
tcg mdviewer.html
tcg mdviewer.py
tcg mendic.py
tcg merge_enfa.py
tcg merge_faen.py
tcg merge_pdf.py
tcg merge_pkg.py
tcg merger.py
tcg mfadic.py
tcg mhtml-to-html
tcg migrate_cf2mp.py
tcg migrate_cf2mp.py 
tcg mini-icons.lua
tcg mini-indent-scope.lua
tcg missing.txt
tcg mk_deptree_svg.py
tcg mk_screenshot.py
tcg mk_stand.py
tcg mk_stand.py 
tcg mk_stand2.py
tcg mk_standalone.py
tcg mk_tree.py
tcg mkart.py
tcg mkart_en.py
tcg mkst.py
tcg mkst.py 
tcg mkstand.py
tcg mktree.py
tcg mkx.py
tcg mocha.lua
tcg monolithei.py
tcg move_tests_dirs.py
tcg mp1.py
tcg mp2.py
tcg mp_bench.py
tcg mpbench.py
tcg multimodal.py
tcg myip.py
tcg nerf_mp3.py 
tcg new2old.py
tcg newrepo.py
tcg nightfox.lua
tcg nmost_repeated_words.py
tcg nolua.py
tcg noneng_pycld2.py 
tcg normalize_fa.py
tcg nul-ls.lua
tcg nvchad.lua
tcg nvim-autopairs.lua
tcg nvim-dap.lua
tcg nvim-lsp-config.lua
tcg nvim-lspconfig.lua
tcg nvim-tree.lua
tcg nvim_client.py
tcg nvimtree.lua
tcg ocr_image.py
tcg octohub.lua
tcg onedark.lua
tcg onedarkpro.orig
tcg op1.lua
tcg open_ai1.py
tcg opencode.lua
tcg opensub.c
tcg opensub.r
tcg opensub.rb
tcg opti9ns.lua
tcg optimize_images.py
tcg optimizer.py
tcg optimpng.py 
tcg options.lua
tcg options.lua 
tcg options2.lua
tcg os2p.py 
tcg padding.py
tcg parallel.py
tcg parser.py
tcg paste.lua
tcg pdf_open.html
tcg pdfdocument.py
tcg perfect_shuffle.html
tcg perpage2.py
tcg perpage_fitz.py
tcg perpage_plumber.py
tcg perplex1.md
tcg pfzf.py
tcg pipget.py
tcg pipget2.py
tcg pkg_resources_reporter_autofixer.py
tcg pkg_resources_reporter_autofixer.py 
tcg pkltojson.py
tcg plugin_yaml.py
tcg plugins.lua
tcg plugins.md
tcg pool_helper.py
tcg pool_helper.py 
tcg pool_helpers.py
tcg postcss.py
tcg pp_pdfminer.py 
tcg pp_pdfminer2.py
tcg pp_pymupdf.py
tcg pp_pypdf.py
tcg pp_pypdf.py 
tcg pp_pypdf2.py
tcg precise.css
tcg precise.md
tcg presence.lua
tcg pret.q
tcg prettier
tcg preview_fonts.html
tcg project_bootstrap.lua
tcg prompt.txt
tcg provider_preferences
tcg proxy_tester.py
tcg psearch.py
tcg puter.html
tcg py-compile.sh
tcg py7z.py 
tcg py_dev.py
tcg py_doc_remover.html
tcg py_regex_builder.html
tcg py_reinstaller.py
tcg py_reinstaller.py 
tcg pycodex.py 
tcg pycommon.py
tcg pydirb.py
tcg pylychee.py
tcg pylychee.py 
tcg pylzmaer.py
tcg pyminify.py
tcg pymonolith.py
tcg pyng.py
tcg pypdfium2.py
tcg pypi2pip.py
tcg pyprettier
tcg pyproject.toml
tcg python-regexbuilder.html
tcg python.lua
tcg q1
tcg q11
tcg q12
tcg q13
tcg q17
tcg q18
tcg q21
tcg q25
tcg q3
tcg q7
tcg q8
tcg random_font.py
tcg readme.md
tcg recommended_options.spec
tcg recover_mht1.py
tcg refactai.lua
tcg refactor_proj.py
tcg reinstaller.py 
tcg remove_content.py
tcg remove_duplicate_functions.py
tcg remove_func.py
tcg remove_gsz.py
tcg remove_header.py
tcg remove_series.py
tcg rename_html_by_title.py
tcg rename_html_by_title.py 
tcg repacopy_entry_point.py 
tcg repli.py
tcg report.sh
tcg resolver.py
tcg response.md
tcg ret_codes.md
tcg revdic.py
tcg rm_c_cpp.py
tcg rm_comments.py
tcg rm_comments.py 
tcg rm_flake8_plugins.py
tcg rm_lines_that_contains.py
tcg rm_moduledoc.py 
tcg rm_translated_lines.py
tcg rmc.py
tcg rmc.py 
tcg rmc1.py
tcg rmc2.py
tcg rmcco.py
tcg rmcco.py 
tcg rmcst.py
tcg rme.sh
tcg rmjs.py
tcg rmlua.py
tcg rst2md.md
tcg ruff2.sh
tcg run_parallel.py
tcg run_parallel_design.py
tcg run_util.py
tcg sanity1.py
tcg sanity2.py
tcg save_messages.lua
tcg search_for_text.py
tcg sed1.sh
tcg semantic_search.py
tcg set_dns.py
tcg settings.lua
tcg setup.cfg
tcg setup.py
tcg setup_git.sh
tcg shiftsrt.py
tcg should_remove.txt
tcg show_ip.py
tcg showtop10git.sh
tcg simpk0le.py
tcg slp.py
tcg smart_archiver.py 
tcg snacks.lua
tcg snacks.lua 
tcg snake.html
tcg snapr.py 
tcg soniq2.py 
tcg sonokai.lua
tcg sort_aliases_by_value.py
tcg sortbylen.py
tcg spec.lua
tcg spell_fnames.py
tcg speller.py
tcg split_lua_plugins.py
tcg split_movies_list.py
tcg split_multiline.py
tcg split_multiline.py 
tcg split_pdf.py
tcg split_pluginss.py
tcg splitfile.py
tcg sqlite2json2.py
tcg sqlite2json3.py
tcg sqlitetojson.py
tcg srtfile.py
tcg srtshift.py
tcg standalone.d.ts
tcg standalone.js
tcg standalone.mjs
tcg standalone.py
tcg statuscol.lua
tcg streaming.md
tcg strip_exif.py 
tcg strip_html_tags.py
tcg strip_html_tags.py 
tcg summarize.py
tcg sumr.py
tcg sumr_nltk.py
tcg svgo.py
tcg t.py 
tcg telescope-fzf-native.lua
tcg telescope.lua
tcg telethon0.py
tcg telethon1.py
tcg template2
tcg termimg.md
tcg termimg0.py
tcg test1.py
tcg test2.py
tcg test_fastwalkee.py
tcg test_url.py
tcg tetris1.html
tcg tgzr.py 
tcg th1.md
tcg thonny.html
tcg thought.md
tcg thought2.md
tcg thought3.md
tcg tide.lua
tcg together.py
tcg tokyo.lua
tcg tomd.py
tcg transliterator.py
tcg transrt.py
tcg tree.py
tcg tree.txt
tcg treesitter-textobjects.lua
tcg treesitter.lua
tcg tscleaner.py
tcg tsrmc.py 
tcg txt_ext
tcg txtext
tcg typo.py
tcg ufo.lua
tcg ui.lua
tcg upgrade.txt
tcg upkl.py
tcg url
tcg url_downloader.py 
tcg urlzz.py 
tcg usage.py
tcg uv
tcg uzz.py
tcg uzz.py 
tcg v1.py
tcg v2.py
tcg v22.py
tcg v3.py
tcg v4.py
tcg vim-matchup.lua
tcg walkdir.py
tcg webpipe.py
tcg wheelpackdirs.py 
tcg which-key.lua 
tcg which_key.lua
tcg whichkey.lua
tcg whitelist.py
tcg whitespace.lua
tcg whl2txz.py 
tcg window_resize.lua
tcg word_freq_counter.py 
tcg x5.py 
tcg xcod.py
tcg xreport2.py
tcg xtar.py
tcg xxx.py
tcg xxx.py 
tcg xzer.py 
tcg yanky.lua
tcg yt2txt.sh
tcg z plugins
tcg z5.py 
tcg z5r.py 
tcg zs.py 
tcg zser.py 
tcg zsr.py 
tcg zstder.py 
tconf
tcs  000.txt
tcs  METADATA 101 101
tcs  METADATA 169 169
tcs  README.md 10 10
tcs  autopep8.py 4263 4273
tcs  cli.py
tcs  conversation_rmc.md  8 8
tcs  filesystem.py 132 136
tcs  furls 260 270
tcs  jobutils.py 15 19
tcs  jpo 3 3
tcs  lua/config/options.lua 52 55
tcs  nvim.log 12 12
tcs  nvim.log 12 22
tcs  options2.lua
tcs  p.json 66 66
tcs  t.py 11 28
tcs  textutils.py 446 464
tcs  ~/.bash_history 100 133
tcs .dns
tcs .github_token
tcs .github_token 
tcs .openai_token 
tcs .z_token
tcs 000.json
tcs 002.sh 
tcs 003.mhtml 2 2
tcs 011.sh 
tcs 043.sh 
tcs 19_45
tcs 223.py 
tcs 4 93 100
tcs 40_68
tcs 4388 1 8
tcs 480/taboo.480 6 6
tcs 6_87.lua
tcs 7zr.py 
tcs Makefile 6 6
tcs README.md
tcs README.md 1 20
tcs README.md 1552 1552
tcs README.md 21 30
tcs README.md 36 43
tcs README.md 39 56
tcs README.md 40 61
tcs README.md 44 48
tcs README.md 44 50
tcs README.md 56 61
tcs README.md 67 71
tcs README.md 72 94
tcs README.md 77 112
tcs README.md 82 90
tcs README.md 98 120
tcs WHEEL
tcs WHEEL 
tcs __init__.py
tcs __init__.py 93 93
tcs _pkg_resources.py
tcs a
tcs a.css
tcs aaa.py
tcs ab
tcs ab 1 5
tcs abb1.json 1 5
tcs abbr.json 1 2
tcs abbr_1.txt
tcs abbr_2.txt
tcs add_stub.py
tcs add_typing.py
tcs afk
tcs afk.py
tcs afk.py 1 400
tcs afk.py 401 686
tcs all.json
tcs ans.md 14 14
tcs ans.md 9 39
tcs answer_g4f.md
tcs apk_font_extractor.py 
tcs append_ty
tcs ar_extract.py 
tcs archive_convert.py 
tcs armc
tcs armc.py
tcs ascan2.py
tcs august/fixext_45.py
tcs autocmds.lua
tcs autocomp.py
tcs bash2py.py 
tcs bb.txt
tcs binaryornot 5 5
tcs blink
tcs blink.py
tcs bnn
tcs brer.py 
tcs brmc.py
tcs brmc.py 
tcs build.sh
tcs build_1.sh 
tcs build_single_page.py  52 60
tcs bzr.py 
tcs c2.lua 148 155
tcs c2.lua 65 85
tcs cargo.toml 
tcs cext.py
tcs cext.py 
tcs cext.py 546 546
tcs cf2mp.py 
tcs cf2mp4.py 179 357
tcs cforyou
tcs chargoon.html 19 22
tcs check4update
tcs check_missing.py
tcs chk_imports
tcs chk_imports.py
tcs chm_lib.c
tcs ci-install.sh
tcs clean_bash.py
tcs clean_lua 6 31
tcs clean_lua.py
tcs clean_record.py
tcs cleanccpp.py 
tcs cleanerts.py 31 34
tcs cleanup_here.cpp
tcs cli.py
tcs clinhtml.py
tcs cmapdb.py
tcs cmp.lua
tcs code_runner.lua
tcs colorscheme.lua
tcs commands.sh 1 1
tcs commands.sh 10 10
tcs commands.sh 11 11
tcs commands.sh 12 12
tcs commands.sh 13 13
tcs commands.sh 14 14
tcs commands.sh 2 2
tcs commands.sh 3 3
tcs commands.sh 4 4
tcs commands.sh 5 5
tcs commands.sh 6 6
tcs commands.sh 7 7
tcs commands.sh 8 8
tcs commands.sh 9 9
tcs commands.vim
tcs compile_previse.md
tcs compress_files.py 
tcs compsub.py 
tcs config.json
tcs const.py 2036 2037
tcs convert2to3.py 
tcs copy_system_pkg_files.py
tcs crawl_movie_site.py
tcs crawler
tcs create_monthly_branch.py
tcs cstrmc
tcs csubdirxz
tcs curl_req.sh
tcs dap.lua
tcs dap.lua 
tcs data_sql.json 1785 1785
tcs ddd.cpp
tcs debugpy 1 1
tcs deepack 35 46
tcs deepack.py 
tcs deepseek.md 3 21
tcs deepseek_bash_20260907_fb4ffe.sh 
tcs delemp.py
tcs delemp.py 
tcs delempco.py 
tcs delempco.py 30 237
tcs detect_pkgresources
tcs detect_pkgresources.py
tcs detect_unused.py
tcs dic.json
tcs dic.json 4 5
tcs dic_en.json 1 5
tcs diff_report.json 26 26
tcs dirb.py
tcs dirb2.py 46 50
tcs do.py
tcs doclin.py
tcs doclin.py 
tcs dup_detector.py
tcs dupwaste.py 1 1
tcs e.json  1 12
tcs enfa.json 2 8
tcs enfa_failed.json
tcs erap
tcs erap.py
tcs example.lua
tcs example.lua 50 70
tcs exlinks.py 
tcs exlkuobimo.vim 
tcs extcst.py 
tcs external.txt 25 25
tcs extract_base64_assets.py 
tcs extract_bash_functions.py 
tcs f24.py 
tcs f2base64 2 2
tcs f2c.py 
tcs failed-en.txt
tcs fast_compress.py 
tcs fast_compress2.py 
tcs fast_compress3.py 
tcs fat.py
tcs fat.py 58 76
tcs fat.py 78 98
tcs fb-fa
tcs fc1 55 61
tcs fc1.py 
tcs felo.txt 25 41
tcs felo_20260824_164511_666.txt
tcs felo_20260824_170901_610.txt  152 164
tcs felo_20260828_120324_695.txt 18 18
tcs fftrsijomu.sh 
tcs fh8.py 67 120
tcs fileutils.py 132 144
tcs fileutils.py 133 145
tcs fileutils.py 243 260
tcs fileutils.py 435 437
tcs fileutils.py 513 520
tcs fileutils.py 573 587
tcs find_missing_imports.py 
tcs fix_bash_shebang
tcs fix_escape
tcs fix_re.py 
tcs fixescape.py
tcs fixescape.py 1 34
tcs fixext
tcs fixext.py
tcs fixextco.py 
tcs fixextco.py 577 583
tcs fixwhlnames.py 
tcs flakeheaven-
tcs flakeheaven-source.txt
tcs fname_recommender.py 190 200
tcs foldext.py
tcs fontconverter.py
tcs fontpre
tcs fontpre.py
tcs fp.html 462 462
tcs fswalker_report_gen.py
tcs furls 260 263
tcs furls.py
tcs furls.py 28 28
tcs gemini-code-1784300579647.py 8 18
tcs generate_init
tcs getrepos.py
tcs gext.py
tcs gext.py 
tcs gextco2.py 
tcs gfast.py
tcs gfixre.py
tcs ghpy.sh
tcs ghpy.txt 9 9
tcs ghpy10
tcs ghpy10.sh
tcs girl_from_plainville 1 1
tcs girl_from_plainville 8 8
tcs git-wtf.rb
tcs gitlinks.txt 115462 115466
tcs glm5.py
tcs gp2 24 37
tcs grmc.py
tcs gziper.py
tcs gzr.py 
tcs hasdoc
tcs hasdoc.py
tcs headers.lua 4 12
tcs health.txt 
tcs hijri.py 9 74
tcs hmin.py
tcs hmin.py 
tcs hmjnedoinc.txt
tcs ibl.lua
tcs ikchzpumkh.txt
tcs img2txt.py 13 19
tcs imports
tcs indent-blankline.lua 30 64
tcs index.html
tcs index.html 525 534
tcs info2md.py 
tcs init.lua
tcs init.lua 23 23
tcs init.vim
tcs inline_assets.py
tcs inline_assets.py 
tcs inside-init.lua
tcs install_rust.sh
tcs iqzptlytjx.txt 
tcs jobutils.py
tcs jobutils.py 
tcs jobutils.py 122 138
tcs jobutils.py 18 18
tcs jobutils.py 31 44
tcs jobutils.py 8 10
tcs jpegsize.sh 
tcs k.lua 
tcs kbvikyvqxt.txt
tcs keep_latest_version.py 
tcs keymaps.lua
tcs kickstart-python.lua 306
tcs kqknvqpdwf.lua 
tcs kuxurmslyw.txt
tcs lastncommits
tcs lazy-setup.lua 12 14
tcs lazy.lua
tcs lazysync
tcs lib.rs
tcs lib.rs 31 55
tcs linux.py
tcs ll 12 19
tcs ll.py 
tcs log.txt
tcs ls
tcs lsp 19 33
tcs lsp.lua 
tcs lsp.lua 19 33
tcs lsp.vim
tcs lt.py 19 38
tcs luasnip.lua 3 3
tcs lzmamter.py 
tcs lzr.py 
tcs make_ruff_rules.py 
tcs markdown_opener.html 3 3
tcs md.css 10 10
tcs mdview.py
tcs merge_enfa.py
tcs merge_faen.py
tcs merge_pkg.py
tcs merger
tcs metadata.json 4 4
tcs metadata.json 8 8
tcs misc_fa.json
tcs missing_files.json 1 20
tcs missing_files.json 1 7
tcs mjetdhdmer.txt 
tcs mk_deptree_svg 16 17
tcs mk_deptree_svg 20 26
tcs mk_stand.py 
tcs mk_stand2.py
tcs mk_standalone.py
tcs mkpic
tcs mkst.py 
tcs mkstand.py
tcs mktree.py
tcs mkx.py
tcs mldonblwgf.txt
tcs move_tests_dirs
tcs move_tests_dirs.py
tcs movies.txt 1 1
tcs movies.txt 1000 1000
tcs my-lazy-neovim-config-3h6o.md 
tcs n t.py 11 28
tcs nerf_mp3.py 
tcs new2old.py
tcs newrepo_17_135843.py
tcs newrepo_20260730_071952.py
tcs nmqufcbosn.txt
tcs nolua.py
tcs noneng_langdet.py 
tcs noneng_pycld2.py 
tcs ntybdvdvol.txt
tcs nvim_setup_linux.sh 56 56
tcs octohub.lua
tcs optimpng.py 
tcs options.lua
tcs options.lua 
tcs options.lua 25 26
tcs options.lua 6 6
tcs options.lua 73 130
tcs options.skel
tcs optwin.lua
tcs os2p.py 
tcs outer_banks 1 1
tcs outer_banks 10 10
tcs outer_banks 2 2
tcs outer_banks 3 3
tcs outer_banks 4 4
tcs outer_banks 5 5
tcs outer_banks 6 6
tcs outer_banks 7 7
tcs outer_banks 8 8
tcs outer_banks 9 9
tcs output.json
tcs p.json
tcs package.json
tcs package.json 2 5
tcs panktvidxd.txt
tcs paste.vim
tcs pddd.py
tcs pdf.min.js
tcs pdf2txt.py
tcs pdfdocument.py
tcs pdfdocument_20260817_221552.py
tcs perpage2.py
tcs perpage_20260816_142037.py
tcs pip 1 1
tcs pip.conf
tcs pipget
tcs pipget.py
tcs pipget.py 
tcs pkg_resources_reporter_autofixer.py
tcs pkg_resources_reporter_autofixer.py 
tcs plugins.vim
tcs pngq
tcs pool_helper.py 
tcs pp_plumber2.py
tcs pp_pypdf2.py 
tcs pqeqimygva.txt
tcs presence.vim
tcs pret.q
tcs preview_fonts.html 559 559
tcs prg 15 22
tcs prg.py
tcs project_bootstrap.lua
tcs prompt.txt 
tcs pu02_1.sql 1 1
tcs py-compile
tcs py7z.py 
tcs py_dev.py
tcs pycodex.py 
tcs pydiff.py
tcs pydocr.py 151 158
tcs pygdu 69 74
tcs pylychee.py 
tcs pypi.html 1 9
tcs pyproj
tcs pyproject.toml
tcs pyrg
tcs pysvg 9 17
tcs pysvg 9 27
tcs python.lua
tcs python.lua 
tcs python.orig
tcs pythonShellcode.py
tcs pytrans 18 18
tcs q1
tcs q1.md
tcs q13
tcs q14
tcs q15
tcs q16
tcs q19
tcs q2
tcs q20
tcs q22
tcs q23
tcs q24
tcs q29
tcs q3
tcs q31
tcs q66
tcs q9
tcs qkirfpmsjb.txt
tcs qq 16 26
tcs refactor_utils.html
tcs reinstaller.py 
tcs remove_func
tcs remove_gsz.py
tcs rename_html_by_title
tcs rename_html_by_title.py 
tcs repacopy_entry_point.py 
tcs requirements.txt 
tcs resize.vim
tcs revdic.py
tcs rm_comments.py 
tcs rm_lines_that_contains
tcs rm_lines_that_contains.py
tcs rm_moduledoc.py 
tcs rmc
tcs rmc.py
tcs rmc.py 
tcs rmc2.py 
tcs rmc_20260818_022030.py
tcs rmc_20260819_120558.py
tcs rmcco.py 
tcs rmcpp.py 129 133
tcs rme.sh
tcs rpack.py
tcs rprompt.py 13 86
tcs rrw 11 11
tcs ruff.lua 
tcs run_parallel.py
tcs s16
tcs s7 2 2
tcs scrape_web.py
tcs scripts/fix_escape.py
tcs settings.vim
tcs setup.py
tcs setup.py 
tcs setup.py 3 17
tcs setup_git.sh 
tcs shameless 1 1
tcs shameless 2 2
tcs shameless 5 5
tcs shameless 6 6
tcs smart_archiver.py 
tcs snapr.py 
tcs sonic
tcs soniq2.py 
tcs sort_alias_by_values
tcs sortbylen.py
tcs spell_fnames.py
tcs spellcheck
tcs spellcheck.py 
tcs split_lua_plugins
tcs sqlite2json2.py 19 27
tcs srtfile.py
tcs srtshift.py
tcs strict_filter_noneng.py 40 40
tcs strict_filter_noneng.py 49 49
tcs strip_comments.py 
tcs strip_exif.py 
tcs strip_html_tags.py 
tcs t.py
tcs t.py 11 28
tcs t5.py 17 34
tcs taboo 1 1
tcs taboo 2 2
tcs taboo 3 3
tcs taboo 4 4
tcs taboo 5 5
tcs taboo 6 6
tcs taboo.480.480.480 6 6
tcs tcg.py 57 74
tcs telethon1.py
tcs telethon1.py 14
tcs telethon2.py 14
tcs template
tcs template 2 7
tcs template 6
tcs template c
tcs termimg.py
tcs tgzr.py 
tcs the.old.man.txt 1 1
tcs the.staircase.txt 1 1
tcs the.staircase.txt 11 11
tcs tlwzukbgoj.lua 
tcs tokyo.lua
tcs translate.py
tcs translate.py 
tcs tree.py
tcs tsext.py 11 85
tcs tsrmc.py 
tcs tt
tcs upkl.py
tcs url 1 1
tcs url 1 1_
tcs url 1 2
tcs url 10 10
tcs url 11 11
tcs url 12 12
tcs url 13 13
tcs url 14 14
tcs url 15 15
tcs url 16 16
tcs url 17 17
tcs url 18 18
tcs url 19 19
tcs url 2 2
tcs url 20 20
tcs url 21 21
tcs url 22 22
tcs url 22 23
tcs url 3 3
tcs url 4 4
tcs url 5 5
tcs url 6 6
tcs url 7 7
tcs url 8 8
tcs url 8 8 
tcs url 9 9
tcs url_downloader.py 
tcs urls.txt 1 1
tcs urlzz.py 
tcs utils.py
tcs utils.py 18 75
tcs uzz.py 
tcs validate_binary_extensions 140 169
tcs vimbits.vim
tcs walkdir.py
tcs webster 548 550
tcs wheelpackdirs.py 
tcs which-key.lua 
tcs which_key.txt 38 45
tcs whichkey.txt 
tcs whitelist.py
tcs whl2txz.py 
tcs wjp_city_list.json 2 15
tcs word_freq_counter.py 
tcs x5.py 
tcs xreport 314
tcs xreport.py
tcs xxx.py 
tcs xzer.py 
tcs yap.py 1 1
tcs yflrntthgw.vim 
tcs yijoxhbemv.txt 
tcs ykkfasupyd.vim 
tcs z5.py 
tcs z5r.py
tcs z5r.py 
tcs zreport 35 43
tcs zs.py 
tcs zser.py 
tcs zsr 34 39
tcs zsr.py 
tcs zstder.py 
tcs zstder.py 130 130
tcs ~/.bashrc 113 113
tcs ~/bin/detect_pkgresources.py
tcs ~/bin/mkx
tcs ~/bin/rmc 232 239
tcs ~/bin/yap.py 1 1
tct coverage2json.py
tcz fileutils.py 243 260
tcz lazy.lua
tdif aaa.py bbb.py
temp
ter_ser
termimg0 nvim1.jpg
termimg0 usa-major-cities-map.jpg
termux-change-repo
termux-open fonts_preview.html
termux-open neovim.html
termux-open rulesruff1.html 
termux-open thonny.html
termux-setup-storage
texinfo aspell.info
textual_pyfiglet
tfn
tfn -a
tfs
tfs README.md 56 61
tfs README.md 56 6q
thonny-textual
tidy --help
tmp
tnn
tnvim
to_jpg
to_jpg 412e1cae51c91f8.gif
to_jpg giphy.webp
tojson dictionary.txt
tojson dictionary.txt  ' '
tojson dictionary.txt ' '
top11
top11 22
tosc colab15mb.py
tosc cpprun.py
tosc cppup.py
tosc dh-uninliner.py 
tosc dh_reverse.py 
tosc dh_uninliner.py 
tosc dupfx.py
tosc filterlines.py 
tosc fix_escape_sequence.py
tosc fixdh.py 
tosc insert_skipdirs.py
tosc insert_skipdirs2.py
tosc invalid_escape_sequence.py
tosc make_ruff_rules.py 
tosc mdview_simple.py
tosc mdviewer.py
tosc mkart.py
tosc mkart_en.py
tosc purepy.py 
tosc recover_mht1.py
tosc reinstaller.sh
tosc remove_dh_dependency.py 
tosc rmcpp.py
tosc rmdoc_cpp.py
tosc sansorvideo.py
tosc show_ip.py
tosc singlefilez2html.py
tosc split_lua_plugins.py
tosc strip_cpp.py
tosc top500.py
tosc top501.py
tosc ts_cpp_doc_remover.py
tosc walker.py
touch __init__.py
touch textual_nvim/__init__.py
toutf8
toutf8 06.srt
toutf8 installer.txt
tox --help
tox run
trafi
trafila
trafila -m
trafila -r
trafila providers.html 
trafila python_concurrency_with_asyncio_matthew_fowler.pdf.html
trans
translate -i 1.txt --source en --target fa
translate -i 2.txt --source en --target fa
translate -i 3.txt --source en --target fa
translate -i 4.txt --source en --target fa
translate -i abbr.txt -s en -t fa
translate -i all --source en --target fa
translate -i class_diagram.py --source ja --target en
translate -i data.json --source zh-CN --target en
translate -i data_sql.json --source auto --target en
translate -i data_sql.json --source he --target en
translate -i data_sql.json --source zh-CN  --target en
translate -i data_sql.json --source zh-CN --target en
translate -i en.txt --source en --target fa
translate -i europarl.test --source auto --target en
translate -i f -s en -t fa
translate -i fa.txt --source fa --target en
translate -i fa_1.txt --source fa --target en
translate -i fa_2.txt --source fa --target en
translate -i fa_3.txt --source fa --target en
translate -i fa_4.txt --source fa --target en
translate -i failed-en.txt --source en --target fa
translate -i failed.txt --source en --target fa
translate -i hunspell.txt --source en --target fa
translate -i hunspell_1.txt --source en --target fa
translate -i hunspell_2.txt --source en --target fa
translate -i w -s en -t fa
translate -i w_1 -s en -t fa
translate -i w_2 -s en -t fa
translate -i w_3 -s en -t fa
translate_noneng_filenames
translte -i w_1 -s en -t fa
transrt -i 01.srt -s en -t fa
transrt -i 02.srt -s en -t fa
tre
tree
tree -H
tree -a
tree -d
tree -f
tree >> tree.txt
tree | tcs2
tree-sitter init-config
tree-sitter parse ast.rs
tree-sitter parse examples/ast.rs
trr
trre
trrr
trs
trss
trydecomp monolith-94qhpl
trydecomp rmc.pkg
trz
tsb
tsext
tsztd
ttee
tuf
twin_files
twin_files -a
twiner
ty  afk.py >> afk.py
ty check yap.py
tyc
tyc  afk.py >> afk.py
tyc .
tyc _pkg_resources.py
tyc a*.py
tyc add2gitignore
tyc add_typing
tyc afk
tyc appendr
tyc auto_enhance
tyc br
tyc cf2mp4.p6
tyc cf2mp4.py
tyc check_rmc.py
tyc cli.py
tyc create_stub
tyc detect_multilune_text.py
tyc detect_pkgresources
tyc detect_pkgresources .
tyc erap
tyc ex_abbr.py
tyc f*.py
tyc fh8.py
tyc fontpre
tyc hmin
tyc imports
tyc jobutils.py
tyc jobutils.py 
tyc merger
tyc move_tests_dirs.py
tyc move_tests_dirs.py-
tyc nolua.py
tyc normalize_fa.py
tyc pdfdocument.py
tyc pngq
tyc pool_helper.py 
tyc py_dev.py
tyc pydirb.py 
tyc pysanity-check
tyc revdic
tyc rfr
tyc rmc
tyc rmc.py
tyc sonic
tyc srtshift.py
tyc strip_html_tags.py 
tyc strip_installed_pkgs.py 
tyc t5
tyc toutf8
tyc tsext
tyc utils.py
tyc utils_sorted.py
tyc yap.py
tyc zstder
tyc zstder --extra-path ~/projects/py/dh/src/dh
tyc zstder --extra-search-path ~/projects/py/dh/src
tyc zstder --extra-search-path ~/projects/py/dh/src/dh
tyc ~/bin/twin_files
type cd
type mvl
type np
type pipdown
type printf
tzstd
ubin
uname -a
unxz
unzip 03.zip
unzip 04.zip
unzip FiraMono.zip
unzip SampleTree.jar
unzip Shameless_US_\ -\ season\ 1.en.zip
unzip base_library.zip
unzip chmlib-master.zip
unzip config.nvim-main.zip
unzip dutree-1.8-py3-none-any.whl 
unzip europarl-test.zip
unzip flake8-4.0.0-py2.py3-none-any.whl
unzip lingua_language_detector-2.2.0-cp314-cp314-win_arm64.whl 
unzip lxml-6.1.1-cp312-cp312-linux_armv8l.whl
unzip neovim-config-master.zip
unzip neovim-for-newbs-main.zip
unzip pandas-2.3.3-cp312-cp312-linux_armv8l.whl
unzip pip-20.3.4-py2.py3-none-any.whl
unzip pip-26.1.2-py3-none-any.whl
unzip pip-26.2.1-py3-none-any.whl
unzip pip-tools-main.zip
unzip pylyzer-0.1.0b0-py3-none-manylinux_2_17_armv8l.manylinux2014_armv8l.whl 
unzip rainbow-delimiters.nvim-master.zip
unzip registry.json.zip 
unzip rpds_py-2026.6.3-cp312-cp312-linux_armv8l.whl
unzip src.zip
unzip w.zip 
unzip workspace-01a041de-4019-7afa-a363-6d2973050a06.zip
unzip workspace-01a068b1-6e03-7849-9ff5-41e443c3234d.zip
unzip xxhash-4.0.1-cp312-cp312-linux_armv8l.whl 
up006
up007
up008
up038
up039
upkl serialized_dictionary.pkl
urlzz
use_mmap1 = lines1_count > 5000
use_mmap2 = lines2_count > 5000
uvreq
uzz
v
v x5.py
va
va appendr.py
va init.lua
va x5.py
validate_binary_extensions
vb x5.py
vc
vc README.md
vc lazy.lua
vc t.py
vc x5.py
vc xcod.py
vd
vd -
vd ttf
vf gz
vg
virtualenv venv
vk
vk xcod.py
vp
vrepos
vulture a*.py
vvv
vz
w1
w2
w3m -dump el_pp.html 
w3m -dump fanar.html
w3m -dump index.html
w3m -dump index_36.html
w3m -dump markdown.css.html
w3m -dump markdown.css.html > markdown.css
w3m -dump neovim.html
w3m -dump pypi.html > pip.txt
w3m -dump python_concurrency_with_asyncio_matthew_fowler.pdf.html
w3m -dump python_concurrency_with_asyncio_matthew_fowler.pdf.md
w3m -dump pythons_pre-declared_constants_are_kinda_weird.html
w3m -dump rulesruff1.html 
wa ap8
wa cd
wa cmk
wa comment
wa cstrmc
wa fco
wa javac
wa lss
wa lvim
wa mhtml2html
wa npm
wa pip
wa prettier
wa protoc
wa pyright
wa rme
wa runpy
wa sqlite3
wa stylua
wa tcs2
wa uzx
wa uzz
wa www
wa yap
wa zoxide
watcher
wc -l afk.py
wc -l commands.sh
wc -l data.json
wc -l requirements.txt
wger 
wget "https://files.pythonhosted.org/packages/04/a4/e3679773ea7eb5b37a2c998e25b017cc5349edf6ba2739d1f32855cfb11b/aiohttp-3.9.5.tar.gz"
wget "https://files.pythonhosted.org/packages/0f/cc/931e8fd88a7730d66ee3b962f954eef1efc9959d618d01574cebf6905dae/flake8-4.0.0-py2.py3-none-any.whl"
wget "https://files.pythonhosted.org/packages/1b/63/b9e1c2170463cff254a0b9927386bd92006cc3d506ef5d29074b1a4c0db2/pypdfium2-4.18.0.tar.gz"
wget "https://files.pythonhosted.org/packages/58/d9/22ce5786ac0c1653ae8b6c23bded02c1686d11f0dbb45b31ce128e0df985/aiohttp-3.14.3.tar.gz"
wget "https://files.pythonhosted.org/packages/a0/b4/f4e45875a4cb1c4f6a76d6d07a2981753aab5f135dac2381f625e8807542/gensim-3.8.3.tar.gz"
wget "https://raw.githubusercontent.com/Alishahryar1/free-claude-code/main/scripts/install.sh"
wget --help
wget -f file_urls.txt
wget -r -A css,js,woff2,woff,otf,ttf https://www.programmingfonts.org
wget -r -A srt  https://www.opensubtitles.com
wget -r -A srt  https://www.opensubtitles.org
wget -r -A srt  subtitlecat.com
wget -r -A srt https://www.subtitlecat.com
wget -r -A srt https://www.subtitlecat.com/subs/
wget -r -A srt my-subs.co
wget -r -A subtitlecat.com
wget -r harrisoncramer.me
wget -r https://harrisoncramer.me/
wget -r https://pypi.org/
wget -r https://www.subtitlecat.com/subs/170/Shameless.US.S01E10.720p.BluRay.x264-REWARD.html
wget -r sebsite.pw
wget http://adventures.michaelfbryan.com/posts/how-not-to-riir/
wget https://cdn.ng-resource.com/product/resource/notegpt/files/2026/08/22/b0573ff59b49416abb857b838c924a74.html
wget https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js
wget https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js
wget https://developer.puter.com/tutorials/free-unlimited-ai-api/
wget https://dls2.aparatchi-dlcenter.top/DonyayeSerial/series/24/Soft.Sub/S02/480p.BluRay/
wget https://dls6.aparatchi-dlcenter.top/DonyayeSerial/series/I.Am.the.Night/Soft.Sub/S01/480p.Web-DL/I.Am.the.Night.S01E02.480p.WEB-DL.SoftSub.DonyayeSerial.mkv
wget https://files.pythonhosted.org/packages/85/9e/a3ba13e08bbee5bf6e57597dfe4823961fd7e94c0b8afe3a4bb7dca639f3/grpcio-1.83.1-cp312-cp312-linux_armv7l.whl
wget https://files.pythonhosted.org/packages/85/9e/a3ba13e08bbee5bf6e57597dfe4823961fd7e94c0b8afe3a4bb7dca639f3/grpcio-1.83.1-cp312-cp312-linux_armv7l.whl0
wget https://files.pythonhosted.org/packages/d9/9a/4019b524b03a13438637b11538c82781a5eda427394380381af8f04f467a/pynacl-1.6.2.tar.gz
wget https://github.com/iamcco/markdown.css/blob/master/dest/github/markdown.css
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.0/FiraMono.zip
wget https://mirror-pipy.runflare.com/refactor-utils
wget https://mirror-pipy.runflare.com/refactor_utils
wget https://mirror-pypi.runflare.com/pip/json
wget https://mirror-pypi.runflare.com/refactor_utils
wget https://mirror-pypi.runflare.com/requests
wget https://mirror-pypi.runflare.com/requests/json
wget https://mirror-pypi.runflare.com/simple/requests
wget https://mirror-pypi.runflare.com/simple/requests/json
wget https://ollama.ai/install.sh
wget https://ollama.ai/install.sh -o ollama.sh
wget https://packages.termux.dev/apt/termux-main/pool/main/p/pulseaudio/pulseaudio_17.0-3_arm.deb
wget https://pypi.org/atom.xml
wget https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh
wget https://serialblog1.top/series/the-madness/
wget https://sourceforge.net/projects/hunspell/files/Hunspell/1.2.15/hunspell-1.2.15.tar.gz
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/language-detection/europarl-test.zip
wget https://www.opensubtitles.org/en/subtitleserve/sub/7860435
where
whl
wif
with ProcessPoolExecutor(max_workers=num_workers) as executor:
wof
woff22ttf cilantro-code-mono.woff2
woff22ttf.py 
woff2_compress  Cilantro_Code_Mono-Regular.ttf
woff2_compress 8b3c6daca15c024.ttf
woff2_compress D2Coding_ligature-Regular.ttf
woff2_compress ab491eb63bca737.ttf
woff2_decompress Aporetic_Sans_Mono-Regular.woff2 
woff2_decompress Cilantro_Code_Mono-Regular.woff2 
woff2_decompress D2Coding_ligature-Regular.woff2
woff2_decompress D2Coding_ligature-Regular.woff2 
woff2_decompress JetBrainsMono_NF_SemiBold-Regular.woff2 
woff2ttf
wp 0
wp dist
wp libcst/
wp minify_html/
wp pip
wp pylibmspack/
wp pypdfium2/
wp pywavelets/
wp site-packages/
wp wheels/
wrapper_gh search repos dotfiles
wtmp
wtmp .
www
x
x'
xclip
xclip --help
xml2json feed.xml
xordup
xreport
xreport2
xs
xtar
xxx
xz -d *.xz
xz -d PyMuPDF.chm.xz
xz -d data_sql.json.xz
xz -d how.html.xz
xz -d i.html.xz
xz -d mupdf-1.26.10-source.tar.xz
xzz PyMuPDF.chm
xzz data.json
xzz data.sqlite
xzz data_sql.json
xzz data_sql.sqlite
xzz github_flavour_markdown.css
xzz how.html
xzz i.html
xzz init.lua
xzz persian_dict_19k.txt
xzz repos.txt
yap
yapf -i -r .
yapf -i -vv -r .
yapf -i -vv .
yes | pip uninstall flake8_quotes flake8_pyi flake8_plugin_utils flake8_import_order
yes | pip uninstall flake8_string_format flake8_scrapy flake8_rst_docstrings flake8_requirements flake8_pytest_style
yes | pip uninstall textual_nvim
yes | pip uninstall textual_slidecontainer
yfn
z bash.d
z conf8g
z config
z lua
z plugind
z plugins
z pluginz
z quotes
zio -FF pylyzer-0.1.0b0-py3-none-manylinux_2_17_armv8l.manylinux2014_armv8l.whl 
zip --help
zip -FF pylyzer-0.1.0b0-py3-none-manylinux_2_17_armv8l.manylinux2014_armv8l.whl 
zip -FF pylyzer-0.1.0b0-py3-none-manylinux_2_17_armv8l.manylinux2014_armv8l.whl --out a.zip
zip -T w.zip 
zip t pylyzer-0.1.0b0-py3-none-manylinux_2_17_armv8l.manylinux2014_armv8l.whl 
zoxide add ~/.config/nvim/lua/configwtmp
zplugins
zstd --ultra -21 --rm mark.css
zstder -d
}
