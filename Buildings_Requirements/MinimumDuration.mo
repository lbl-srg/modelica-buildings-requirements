within Buildings_Requirements;
block MinimumDuration
  "Block that verifies whether a signal is true for a minimum time"
  extends Buildings_Requirements.BaseClasses.PartialRequirement;

  parameter Modelica.Units.SI.Time durationMin "Minimum duration (> 0)";

  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput u
    "Set to true if monitoring needs to be active" annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}}), iconTransformation(
          extent={{-140,-20},{-100,20}})));

  Modelica_Requirements.ChecksInFixedWindow.MinDuration minDur(
    check=true,
    final durationMin=durationMin) "Check for minimum duration"
    annotation (Placement(transformation(extent={{-40,-10},{0,10}})));
equation
  connect(u, minDur.condition) annotation (Line(points={{-120,0},{-84,0},{-84,0.1},
          {-42,0.1}}, color={255,0,255}));
  connect(minDur.y, req.property) annotation (Line(points={{1,0},{16,0},{16,-80},
          {30,-80}}, color={255,0,128}));
  annotation (
    defaultComponentName="minDur",
  Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
        Ellipse(
          extent={{-60,88},{60,-32}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=135,
          origin={24,80},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=90,
          origin={52,48},
          pattern=LinePattern.None,
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=45,
          origin={52,4},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{40,32},{60,20}},
          fillPattern=FillPattern.Solid,
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=135,
          origin={94,10},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=90,
          origin={52,-52},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{20,58},{40,46}},
          fillPattern=FillPattern.Solid,
          rotation=45,
          origin={-18,-66},
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Rectangle(
          extent={{-60,34},{-40,22}},
          fillPattern=FillPattern.Solid,
          lineColor={95,95,95},
          fillColor={95,95,95}),
        Line(points={{-1,28},{40,68}}, color={95,95,95}),
        Ellipse(
          extent={{11,20},{-9,40}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-62,-48},{50,-78}},
          textColor={0,0,0},
          textString="%durationMin")}),
    Documentation(info="<html>
<p>
Block that verifies whether the input signal <code>u</code> remains <code>true</code>
for a specified minimum duration.
</p>
</html>", revisions="<html>
<ul>
<li>
December 19, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"));
end MinimumDuration;
