within Buildings_Requirements.BaseClasses;
partial block PartialRequirement "Partial class for requirements"
  parameter String name="unnamed"
    "Name of instance from which variables are used for observation";

  Modelica_Requirements.Verify.Requirement req(text=text)
    "Requirement check"
    annotation (Placement(transformation(extent={{32,-90},{92,-70}})));
  parameter String text="" "Requirement stated in natural language";
  inner Modelica_Requirements.Interfaces.ObservationID observationID(final name
      =name) "Observation ID"
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  annotation (
    defaultComponentName="reqWitBan",
  Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          lineThickness=5.0,
          fillColor={235,235,235},
          fillPattern=FillPattern.Solid,
          borderPattern=BorderPattern.Raised,
          radius=0),
        Text(
          extent={{-140,160},{160,120}},
          textString="%name",
          textColor={0,0,255})}));
end PartialRequirement;
