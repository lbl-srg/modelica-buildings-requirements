within Buildings_Requirements.Validation;
model WithinBand_corrected
  "Example to show the correction of the WithinBand model"
  extends Modelica.Icons.Example;
  Buildings_Requirements.WithinBand reqWitBan(
    name="Tentative",
    u_max=1,
    u_min=-1) annotation (Placement(transformation(extent={{0,20},{20,40}})));
  WithinBand_old reqWitBan_old(
    name="Previous",
    u_max=1,
    u_min=-1) annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(const.y, reqWitBan_old.u) annotation (Line(points={{-39,0},{-20,0},{
          -20,-26},{-1,-26}}, color={0,0,127}));
  connect(const.y, reqWitBan.u) annotation (Line(points={{-39,0},{-20,0},{-20,
          34},{-1,34}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end WithinBand_corrected;
