{{- define "conductor-oss-conductor.podLabels" -}}
{{ include "conductor-oss-conductor.selectorLabels" . }}
{{- if .Values.podLabels }}
{{ include "common.tplvalues.render" (dict "value" .Values.podLabels "context" $) }}
{{- end }}
{{- end -}}
