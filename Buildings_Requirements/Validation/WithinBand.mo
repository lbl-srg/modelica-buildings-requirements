within Buildings_Requirements.Validation;
model WithinBand
  "Validation model for block that verifies whether a signal is within a certain band when active"
  extends Modelica.Icons.Example;
  inner Modelica_Requirements.Verify.PrintViolations printViolations
    "Prints requirements violations"
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Buildings_Requirements.WithinBand reqWitBan(
    text="Test whether signal is within band",
    u_max=0.5,
    u_min=-0.5) annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Buildings_Requirements.WithinBand reqWitBan1(
    text="Test whether signal is within band",
    use_activeInput=true,
    u_max=0.5,
    u_min=-0.5)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin sin(freqHz=1)
    annotation (Placement(transformation(extent={{-60,18},{-40,38}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Constant off(k=false)
    "Outputs false"
    annotation (Placement(transformation(extent={{-60,-44},{-40,-24}})));
  Buildings_Requirements.WithinBand reqWitBan2(
    text="Test whether signal is within band",
    use_activeInput=true,
    u_max=0.5,
    u_min=-0.5)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul(period=0.25)
    annotation (Placement(transformation(extent={{-60,-84},{-40,-64}})));
equation
  connect(sin.y, reqWitBan.u) annotation (Line(points={{-38,28},{-10,28},{-10,34},
          {19,34}}, color={0,0,127}));
  connect(sin.y, reqWitBan1.u) annotation (Line(points={{-38,28},{-10,28},{-10,-26},
          {19,-26}}, color={0,0,127}));
  connect(off.y, reqWitBan1.active) annotation (Line(points={{-38,-34},{18,-34}},
                               color={255,0,255}));
  connect(reqWitBan2.u, sin.y) annotation (Line(points={{19,-66},{-10,-66},{-10,
          28},{-38,28}}, color={0,0,127}));
  connect(booPul.y, reqWitBan2.active) annotation (Line(points={{-38,-74},{18,
          -74}},               color={255,0,255}));
  annotation (experiment(
      StopTime=60,
      Tolerance=1e-06,
      __Dymola_Algorithm="Radau"),
      __Dymola_Commands(file=
          "modelica://IndustrialPilot/Resources/Scripts/Dymola/Requirements/Validation/WithinBand.mos"
        "Simulate and plot"),
  Documentation(info="<html>
<p>
Model that validates the test whether a signal is within a band when
the test is active.
</p>
<p>
The two instances at the top are configured the same, but for one, the test is active,
and the other the test is inactive.
For the inactive test, the verification yields <code>Undecided</code>.
</p>
<p>
The instance at the bottom is only sometimes active.
</p>
</html>", revisions="<html>
<ul>
<li>
December 19, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"));
end WithinBand;
