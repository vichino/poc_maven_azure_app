package dockerfile.not_root

deny[msg] {
  some i
  instr := input[i]
  cmd := lower( pick([instr.Cmd, instr.Instruction], "") )
  cmd == "user"
  val := trim(lower( pick([instr.Value, instr.Arg, instr.Args], "") ))
  re_match("^(root|0)(:.*)?$", val)
  msg := sprintf("El Dockerfile usa USER '%s' (no debe ser root/uid 0).", [val])
}

pick(vals, dflt) = out {
  some i
  vals[i] != null
  out := vals[i]
} else = dflt
