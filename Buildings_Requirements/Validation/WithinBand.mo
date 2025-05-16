within Buildings_Requirements.Validation;
model WithinBand
  "Validation model for block that verifies whether a signal is within a certain band when active"
  extends Modelica.Icons.Example;
  inner Modelica_Requirements.Verify.PrintViolations printViolations
    "Prints requirements violations"
    annotation (Placement(transformation(extent={{120,60},{140,80}})));
  Buildings_Requirements.WithinBand reqWitBan(
    text="Test whether signal is within band",
    u_max=0.5,
    u_min=-0.5) annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  Buildings_Requirements.WithinBand reqWitBan1(
    text="Test whether signal is within band",
    use_activeInput=true,
    u_max=0.5,
    u_min=-0.5)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin sin(freqHz=1)
    annotation (Placement(transformation(extent={{-140,58},{-120,78}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Constant off(k=false)
    "Outputs false"
    annotation (Placement(transformation(extent={{-140,-4},{-120,16}})));
  Buildings_Requirements.WithinBand reqWitBan2(
    text="Test whether signal is within band",
    use_activeInput=true,
    u_max=0.5,
    u_min=-0.5)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul(period=0.25)
    annotation (Placement(transformation(extent={{-140,-44},{-120,-24}})));
  Buildings_Requirements.WithinBand reqCon1(
    text="Test whether signal is within band",
    use_activeInput=false,
    u_max=0.5,
    u_min=-0.5) "Requirments check for constant input"
    annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant zer(k=0) "Outputs zero"
    annotation (Placement(transformation(extent={{40,24},{60,44}})));
  Buildings_Requirements.WithinBand reqCon2(
    text="Test whether signal is within band",
    use_activeInput=false,
    u_max=0.5,
    u_min=-0.5) "Requirments check for constant input"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant zer1(k=0.5)
                                                             "Outputs zero"
    annotation (Placement(transformation(extent={{40,-16},{60,4}})));
  Buildings_Requirements.WithinBand reqCon3(
    text="Test whether signal is within band",
    use_activeInput=false,
    u_max=0.5,
    u_min=-0.5) "Requirments check for constant input"
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant zer2(k=-0.5)
                                                             "Outputs zero"
    annotation (Placement(transformation(extent={{40,-56},{60,-36}})));
equation
  connect(sin.y, reqWitBan.u) annotation (Line(points={{-118,68},{-90,68},{-90,74},
          {-61,74}},color={0,0,127}));
  connect(sin.y, reqWitBan1.u) annotation (Line(points={{-118,68},{-90,68},{-90,
          14},{-61,14}},
                     color={0,0,127}));
  connect(off.y, reqWitBan1.active) annotation (Line(points={{-118,6},{-62,6}}, color={255,0,255}));
  connect(reqWitBan2.u, sin.y) annotation (Line(points={{-61,-26},{-90,-26},{-90,
          68},{-118,68}},color={0,0,127}));
  connect(booPul.y, reqWitBan2.active) annotation (Line(points={{-118,-34},{-62,
          -34}},               color={255,0,255}));
  connect(zer.y, reqCon1.u)
    annotation (Line(points={{62,34},{79,34}}, color={0,0,127}));
  connect(zer1.y, reqCon2.u)
    annotation (Line(points={{62,-6},{79,-6}}, color={0,0,127}));
  connect(zer2.y, reqCon3.u)
    annotation (Line(points={{62,-46},{79,-46}}, color={0,0,127}));
  annotation (experiment(
      StopTime=60,
      Tolerance=1e-06,
      __Dymola_Algorithm="Radau"),
      __Dymola_Commands(file=
          "modelica://Buildings_Requirements/Resources/Scripts/Dymola/Requirements/Validation/WithinBand.mos"
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
The instance <code>reqWitBan2</code> only sometimes active.
</p>
<p>
The instances <code>reqCon*</code>
are always active and test a continuous input signal that is at the bounds and within bounds.
</p>
</html>", revisions="<html>
<ul>
<li>
May 16, 2025, by Michael Wetter:<br/>
Expanded test cases.</br>
This is for <a href=\"https://github.com/lbl-srg/modelica-buildings-requirements/issues/2\">issue 2</a>.
</li>
<li>
December 19, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"),
    Diagram(coordinateSystem(extent={{-160,-100},{160,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end WithinBand;
