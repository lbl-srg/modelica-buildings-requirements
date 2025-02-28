within Buildings_Requirements;
block StableContinuousSignal
  "Block that verifies whether a signal is stable when the test is active"
  extends Buildings_Requirements.BaseClasses.PartialSignalTestWhenActive;

  parameter Modelica.Units.SI.Time T=360 "Length of sliding time window";
  parameter Real t(unit="1/s")=0.01
    "Average signal speed during the sliding window above which the signal is deemed as unstable";

  Modelica.Blocks.Interfaces.RealInput u
    "Monitored quantity" annotation (
      Placement(transformation(extent={{-140,20},{-100,60}}),
        iconTransformation(extent={{-120,30},{-100,50}})));

  Buildings.Controls.OBC.CDL.Reals.GreaterThreshold greThr(
    final t=t,
    h=t/20)
    "Check whether signal is stable"
    annotation (Placement(transformation(extent={{70,30},{90,50}})));

protected
  Modelica.Blocks.Continuous.Derivative derU(
    final k=1,
    T=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    x_start=0) "Derivative of the input signal"
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Buildings.Controls.OBC.CDL.Reals.Switch swiVer
    "Switch to enable verification"
    annotation (Placement(transformation(extent={{40,30},{60,50}})));
  Buildings.Controls.OBC.CDL.Logical.TrueDelay truDelVer(
    final delayTime=T,
    delayOnInit=true)
    "Delay for start of the verification, used to make sure the moving average has been computed"
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant con(
    final k=0)
    "Outputs zero before tests is enabled"
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  Buildings.Controls.OBC.CDL.Reals.Switch swiCom
    "Switch to keep the input to the integrators constant if the verification is disabled"
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  Buildings.Controls.OBC.CDL.Reals.Abs abs
    "Absolute value of the signal time derivative"
    annotation (Placement(transformation(extent={{-30,30},{-10,50}})));
  Modelica_Requirements.SignalAnalysis.MovingAverage movAve(
    final T=T)
    "Moving average of the signal"
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
equation
  connect(greThr.y, booToInt.u) annotation (Line(points={{92,40},{96,40},{96,
          -12},{-26,-12},{-26,-30},{-22,-30}},
                                          color={255,0,255}));
  connect(truDel.y, movAve.active) annotation (Line(points={{-58,-40},{-34,-40},
          {-34,-10},{10,-10},{10,28}}, color={255,0,255}));
  connect(abs.y, movAve.u)
    annotation (Line(points={{-8,40},{-2,40}},   color={0,0,127}));
  connect(abs.u, derU.y)
    annotation (Line(points={{-32,40},{-39,40}}, color={0,0,127}));
  connect(act.y, movAve.active) annotation (Line(points={{-58,-10},{10,-10},{10,
          28}},     color={255,0,255}));
  connect(swiVer.y, greThr.u)
    annotation (Line(points={{62,40},{68,40}}, color={0,0,127}));
  connect(truDelVer.u, truDel.y) annotation (Line(points={{-22,10},{-34,10},{-34,
          -40},{-58,-40}}, color={255,0,255}));
  connect(truDelVer.u, act.y) annotation (Line(points={{-22,10},{-34,10},{-34,-10},
          {-58,-10}}, color={255,0,255}));
  connect(truDelVer.y, swiVer.u2) annotation (Line(points={{2,10},{34,10},{34,40},
          {38,40}},                 color={255,0,255}));
  connect(movAve.y, swiVer.u1) annotation (Line(points={{21,40},{30,40},{30,48},
          {38,48}}, color={0,0,127}));
  connect(con.y, swiVer.u3) annotation (Line(points={{-68,80},{24,80},{24,32},{38,
          32}}, color={0,0,127}));
  connect(act.y, swiCom.u2) annotation (Line(points={{-58,-10},{-54,-10},{-54,20},
          {-96,20},{-96,40},{-92,40}}, color={255,0,255}));
  connect(truDel.y, swiCom.u2) annotation (Line(points={{-58,-40},{-52,-40},{-52,
          20},{-96,20},{-96,40},{-92,40}}, color={255,0,255}));
  connect(u, swiCom.u1) annotation (Line(points={{-120,40},{-98,40},{-98,48},{-92,
          48}}, color={0,0,127}));
  connect(con.y, swiCom.u3) annotation (Line(points={{-68,80},{-66,80},{-66,60},
          {-94,60},{-94,32},{-92,32}}, color={0,0,127}));
  connect(derU.u, swiCom.y)
    annotation (Line(points={{-62,40},{-68,40}}, color={0,0,127}));
  connect(intSwi.u2, truDelVer.y) annotation (Line(points={{18,-50},{14,-50},{14,
          10},{2,10}}, color={255,0,255}));
  annotation (
    defaultComponentName="staSig",
  Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
        Line(
          points={{-62,40},{58,40}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-62,-40},{58,-40}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-38,-40},{-50,-40},{-62,40},{-78,40}},
          color={0,140,72},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Text(
          extent={{-62,-52},{50,-82}},
          textColor={0,0,0},
          textString="%T"),
        Line(
          points={{-4,40},{-22,40},{-28,-34},{-42,-40}},
          color={0,140,72},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{6,-40},{-2,-40},{-6,40},{-14,40}},
          color={255,0,0},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{22,40},{10,40},{8,-40},{0,-40}},
          color={255,0,0},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{54,40},{42,40},{40,-40},{32,-40}},
          color={255,0,0},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{38,-40},{30,-40},{26,40},{18,40}},
          color={255,0,0},
          smooth=Smooth.Bezier,
          thickness=0.5)}),
    Documentation(info="<html>
<p>
Block that verifies whether the input signal <code>u</code> is stable.
</p>
<p>
The input signal is considered stable if it does not have a high amount of oscillations.
</p>
<p>
To use this block, set <code>delayTime</code> to a value that is reasonable for
the system to achieve quasy steady state.
For example, if used with a chiller controller and transients after switching
the chiller on should be ignored for <i>600</i> seconds,
set <code>delayTime=600</code> seconds.
Set the length of the sliding time window <code>T</code> to be a few times larger
than the settling time of the closed loop control process.
For example, if a control valve takes about 120 seconds
to achieve steady-state, try <code>T=360</code> seconds.
The threshold is by default set to <code>t=0.01</code> s<sup>-1</sup>.
By looking at the instance <code>greThr</code>, one can see how close the
signal is to the threshold, and increase or decrease <code>t</code> accordingly.
</p>
<h4>Implementation</h4>
<p>
The amount of oscillation is measured by comparing an average speed of the signal <code>u</code>
against the threshold <code>t</code>.
The average speed of the signal is computed by approximating the time derivative
of the input, and then taking its absolute value to convert an approximate velocity
to an approximate speed. Next, the moving average of this approximate speed
is computed over the sliding time window <code>T</code>.
If this moving average is below the threshold <code>t</code>, the signal
is considered stable, otherwise it is considered unstable.
</p>
<p>
This implementation has been selected to avoid state events that would have
occured if the change in signal direction would have been used as an indicator
for stability.
</p>
</html>", revisions="<html>
<ul>
<li>
December 23, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"));
end StableContinuousSignal;
