local grafana = import "../grafonnet-lib/grafonnet/grafana.libsonnet";
local dashboard = grafana.dashboard;
local row = grafana.row;
local singlestat = grafana.singlestat;

dashboard.new(
    "NodeJS App",
    tags=["NodeJS"],
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
            "Test"
        )
    )
)
