
local grafana = import "../grafonnet-lib/grafonnet/grafana.libsonnet";
local dashboard = grafana.dashboard;
local row = grafana.row;
local singlestat = grafana.singlestat;
local prometheus = grafana.prometheus;

dashboard.new(
    "JVM",
    tags=["java"],
)
.addRow(
    row.new()
    .addPanel(
        singlestat.new(
            "uptime",
            format="s",
            datasource="Graphite",
            span=2,
            valueName="current",
        )
        .addTarget(
            prometheus.target(
                "time()-process_start_time_seconds{env=\"$env\",job=\"$job\",instance=\"$instance\"}",
            )
        )
    )
)
