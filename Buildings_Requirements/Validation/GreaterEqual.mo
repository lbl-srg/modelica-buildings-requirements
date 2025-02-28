within Buildings_Requirements.Validation;
model GreaterEqual
  "Validation model for block that verifies whether a signal is greater or equal than another signal"
  extends Modelica.Icons.Example;
  inner Modelica_Requirements.Verify.PrintViolations printViolations
    "Prints requirements violations"
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin sin(freqHz=1)
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Constant off(k=false)
    "Outputs false"
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul(period=0.25)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Buildings_Requirements.GreaterEqual greAct
    "Block that verifies whether a signal is larger than another one"
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant con(k=0) "Outputs zero"
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Buildings_Requirements.GreaterEqual greAct1(use_activeInput=
        true)
    "Block that verifies whether a signal is larger than another one"
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Buildings_Requirements.GreaterEqual greAct2(use_activeInput=
        true)
    "Block that verifies whether a signal is larger than another one"
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Buildings_Requirements.GreaterEqual greAct3(use_activeInput=
        true)
    "Block that verifies whether a signal is larger than another one"
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
equation
  connect(greAct.u_max, sin.y) annotation (Line(points={{19,66},{-10,66},{-10,80},
          {-38,80}}, color={0,0,127}));
  connect(sin.y, greAct1.u_max) annotation (Line(points={{-38,80},{-10,80},{-10,
          26},{19,26}}, color={0,0,127}));
  connect(sin.y, greAct2.u_max) annotation (Line(points={{-38,80},{-10,80},{-10,
          -14},{19,-14}}, color={0,0,127}));
  connect(con.y, greAct1.u_min) annotation (Line(points={{-38,50},{-6,50},{-6,22},
          {19,22}}, color={0,0,127}));
  connect(con.y, greAct2.u_min) annotation (Line(points={{-38,50},{-6,50},{-6,-18},
          {19,-18}}, color={0,0,127}));
  connect(off.y, greAct1.active) annotation (Line(points={{-38,-20},{0,-20},{0,16},
          {18,16}},  color={255,0,255}));
  connect(booPul.y, greAct2.active) annotation (Line(points={{-38,-50},{0,-50},{
          0,-24},{18,-24}}, color={255,0,255}));
  connect(greAct.u_min, con.y) annotation (Line(points={{19,62},{-6,62},{-6,50},
          {-38,50}}, color={0,0,127}));
  connect(con.y, greAct3.u_max) annotation (Line(points={{-38,50},{-10,50},{-10,
          -64},{19,-64}}, color={0,0,127}));
  connect(con.y, greAct3.u_min) annotation (Line(points={{-38,50},{-10,50},{-10,
          -68},{19,-68}}, color={0,0,127}));
  connect(booPul.y, greAct3.active) annotation (Line(points={{-38,-50},{0,-50},{
          0,-74},{18,-74}}, color={255,0,255}));
  annotation (experiment(
      StopTime=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Radau"),
      __Dymola_Commands(file=
          "modelica://IndustrialPilot/Resources/Scripts/Dymola/Requirements/Validation/GreaterEqual.mos"
        "Simulate and plot"),
  Documentation(info="<html>
<p>
Model that validates the test whether a signal is greater or equal than another signal when
the test is active.
</p>
<p>
The two instances at the top are configured the same, but for one, the test is active,
and the other the test is inactive.
For the inactive test, the verification yields <code>Undecided</code>.
</p>
<p>
The thrid instance from the top is only sometimes active.
</p>
<p>
The instance at the bottom satisfies the verification.
</p>
</html>", revisions="<html>
<ul>
<li>
December 19, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"));
end GreaterEqual;
