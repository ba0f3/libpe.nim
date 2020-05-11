{.passL: "-lssl -lcrypto".}
{.passC: "-Iprivate/libpe/include".}
{.compile: "private/libpe/libfuzzy/edit_dist.c".}
{.compile: "private/libpe/libfuzzy/fuzzy.c".}
{.compile: "private/libpe/libudis86/decode.c".}
{.compile: "private/libpe/libudis86/itab.c".}
{.compile: "private/libpe/libudis86/syn-att.c".}
{.compile: "private/libpe/libudis86/syn.c".}
{.compile: "private/libpe/libudis86/syn-intel.c".}
{.compile: "private/libpe/libudis86/udis86.c".}
{.compile: "private/libpe/error.c".}
{.compile: "private/libpe/exports.c".}
{.compile: "private/libpe/hashes.c".}
{.compile: "private/libpe/imports.c".}
{.compile: "private/libpe/resources.c".}
{.compile: "private/libpe/pe.c".}


import private/[dir_import, dir_resources, dir_security, directories, error, exports, hashes, hdr_coff, hdr_dos, hdr_optional, imports, macros, pe, sections]
export dir_import, dir_resources, dir_security, directories, error, exports, hashes, hdr_coff, hdr_dos, hdr_optional, imports, macros, pe, sections


when isMainModule:
  var
    ctx: pe_ctx_t
    err: pe_err_e

  err = pe_load_file(addr ctx, "mydll.dll")

  if err != LIBPE_E_OK:
    echo $err
    quit(1)

  err = pe_parse(addr ctx)

  if err != LIBPE_E_OK:
    echo $err
    quit(1)

  if not pe_is_pe(addr ctx):
    quit(1)

  echo "Entrypoint: ", ctx.pe.entrypoint