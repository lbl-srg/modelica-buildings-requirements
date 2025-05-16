within Buildings_Requirements.Validation;
model StableContinuousSignal
  "Validation model for block that verifies whether a signal is stable when active"
  extends Modelica.Icons.Example;
  inner Modelica_Requirements.Verify.PrintViolations printViolations
    "Prints requirements violations"
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin sin(
    amplitude=0.5,
    freqHz=0.1/120,
    offset=0.5)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  Buildings_Requirements.StableContinuousSignal staSigOn(T=120)
    "Verification for signal to be stable"
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul(period=600)
    annotation (Placement(transformation(extent={{-60,16},{-40,36}})));
  Buildings_Requirements.StableContinuousSignal staSigPul(use_activeInput
      =true, T=120)
             "Verification for signal to be stable"
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Sin sin1(
    amplitude=0.5,
    freqHz=1/120,
    offset=0.5)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Buildings_Requirements.StableContinuousSignal staSigOn1
    "Verification for signal to be stable"
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Pulse booPul1(period=1200)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Buildings_Requirements.StableContinuousSignal staSigPul1(
      use_activeInput=true)
             "Verification for signal to be stable"
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
equation
  connect(staSigOn.u, sin.y) annotation (Line(points={{19,74},{-10,74},{-10,70},
          {-38,70}}, color={0,0,127}));
  connect(staSigPul.u, sin.y) annotation (Line(points={{19,34},{-10,34},{-10,70},
          {-38,70}}, color={0,0,127}));
  connect(booPul.y, staSigPul.active) annotation (Line(points={{-38,26},{18,26}},
                               color={255,0,255}));
  connect(staSigOn1.u, sin1.y) annotation (Line(points={{19,-6},{-10,-6},{-10,
          -10},{-38,-10}}, color={0,0,127}));
  connect(staSigPul1.u, sin1.y) annotation (Line(points={{19,-46},{-10,-46},{
          -10,-10},{-38,-10}}, color={0,0,127}));
  connect(booPul1.y, staSigPul1.active) annotation (Line(points={{-38,-50},{-10,
          -50},{-10,-54},{18,-54}}, color={255,0,255}));
  annotation (experiment(
      StopTime=1200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Radau"),
      __Dymola_Commands(file=
          "modelica://Buildings_Requirements/Resources/Scripts/Dymola/Requirements/Validation/StableContinuousSignal.mos"
        "Simulate and plot"),
  Documentation(info="<html>
<p>
Model that validates the test whether a signal is stable.
</p>
<p>
The two instances at the top are connected to a signal that is,
for the given block configurations, considerd stable or, at times, <code>Undecided</code>.
</p>
<p>
The two instances at the bottom fail the verification test as the signal
is unstable.
</p>
</html>", revisions="<html>
<ul>
<li>
December 19, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"));
end StableContinuousSignal;
