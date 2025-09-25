Diferencias entre los 3 workflows de seguridad:
WorkflowCuándo se ejecutaQué hacePropósitoPR QualityAl crear/actualizar PRsAnálisis inmediato de código y dependenciasFeedback rápido antes del mergeCodeQLPush a main + PRs + semanalAnálisis profundo de vulnerabilidades en códigoDetección de patrones insegurosDependabotAutomático semanalActualiza dependencias obsoletas/vulnerablesMantenimiento proactivo
PR Quality & Security

Trigger: Pull requests
Función: "Portero de calidad"
Ejecuta: Build, tests, OWASP, Trivy
Resultado: Feedback inmediato en el PR
Bloquea: NO (continue-on-error: true)

CodeQL

Trigger: Push a main + PRs + programado (lunes 2AM)
Función: Análisis estático avanzado
Ejecuta: Escaneo de patrones de vulnerabilidad en tu código
Resultado: GitHub Security tab con alertas detalladas
Especialidad: Detecta SQL injection, XSS, buffer overflows, etc.

Dependabot

Trigger: Automático semanal
Función: "Asistente de actualizaciones"
Ejecuta: Revisa pom.xml y workflows buscando versiones nuevas
Resultado: Abre PRs automáticos con actualizaciones
Ejemplo: "Update Spring Boot from 2.7.18 to 2.7.19"

Flujo típico:

Desarrollas → Creas PR
PR Quality → Escanea inmediatamente
CodeQL → Analiza cuando haces merge
Dependabot → Te avisa semanalmente de actualizaciones
Security tab → Centraliza todos los hallazgos

Complementariedad:

PR Quality: Prevención (antes del merge)
CodeQL: Detección (análisis profundo)
Dependabot: Mantenimiento (actualizaciones automáticas)

Cada uno cubre un aspecto diferente del ciclo de vida de seguridad del software.