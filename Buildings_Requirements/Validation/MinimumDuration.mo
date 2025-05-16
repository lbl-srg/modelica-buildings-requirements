within Buildings_Requirements.Validation;
model MinimumDuration
  "Validation model for block that verifies a minimum duration"
  extends Modelica.Icons.Example;
  Buildings_Requirements.MinimumDuration minDur10(text="Test for 10 s",
      durationMin=10) "Test for minimum duration"
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Buildings_Requirements.MinimumDuration minDur20(text="Test for 20 s",
      durationMin=20) "Test for minimum duration"
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul(period=30)
    "Boolean pulse signal"
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  inner Modelica_Requirements.Verify.PrintViolations printViolations
    "Prints requirements violations"
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
equation
  connect(booPul.y, minDur10.u)
    annotation (Line(points={{-38,50},{18,50}}, color={255,0,255}));
  connect(booPul.y, minDur20.u) annotation (Line(points={{-38,50},{-10,50},{-10,
          10},{18,10}}, color={255,0,255}));
  annotation (experiment(
      StopTime=60,
      Tolerance=1e-06,
      __Dymola_Algorithm="Radau"),
      __Dymola_Commands(file=
          "modelica://Buildings_Requirements/Resources/Scripts/Dymola/Requirements/Validation/MinimumDuration.mos"
        "Simulate and plot"),
  Documentation(info="<html>
<p>
Model that validates the minimum duration block.
</p>
<p>
The two instances are configured for a different minimum duration.
One of them will violate the requirement, and the other
satisfies it.
</p>
</html>", revisions="<html>
<ul>
<li>
December 19, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"));
end MinimumDuration;
