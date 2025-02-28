within Buildings_Requirements;
block GreaterEqual
  "Block that verifies whether a signal is greater or equal than another signal when the test is active"
  extends Buildings_Requirements.BaseClasses.PartialSignalTestWhenActive;

  Modelica.Blocks.Interfaces.RealInput u_max
    "Bigger quantity" annotation (
      Placement(transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-120,50},{-100,70}})));

  Modelica.Blocks.Interfaces.RealInput u_min
    "Smaller quantity" annotation (
      Placement(transformation(extent={{-140,0},{-100,40}}),
        iconTransformation(extent={{-120,10},{-100,30}})));

  Buildings.Controls.OBC.CDL.Reals.Less    lesThr(
                                               h=0)
    "Tests wether u1 is less than u2"
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
protected
  Buildings.Controls.OBC.CDL.Reals.Switch swi
    "Switch to disable activation of verification. This can avoid state events if the verification is inactive"
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
equation
  connect(lesThr.y, booToInt.u)
    annotation (Line(points={{42,60},{52,60},{52,-10},{-26,-10},{-26,-30},{-22,
          -30}},                                 color={255,0,255}));
  connect(lesThr.u1, u_max) annotation (Line(points={{18,60},{-120,60}},
                      color={0,0,127}));
  connect(truDel.y, swi.u2) annotation (Line(points={{-58,-40},{-34,-40},{-34,
          40},{-22,40}},
                    color={255,0,255}));
  connect(swi.u1, u_min) annotation (Line(points={{-22,48},{-90,48},{-90,20},{
          -120,20}}, color={0,0,127}));
  connect(swi.y, lesThr.u2) annotation (Line(points={{2,40},{10,40},{10,52},{18,
          52}}, color={0,0,127}));
  connect(swi.u3, u_max) annotation (Line(points={{-22,32},{-40,32},{-40,60},{
          -120,60}}, color={0,0,127}));
  connect(act.y, swi.u2) annotation (Line(points={{-58,-10},{-30,-10},{-30,40},
          {-22,40}}, color={255,0,255}));
  connect(act.y, intSwi.u2) annotation (Line(points={{-58,-10},{-30,-10},{-30,
          -50},{18,-50}}, color={255,0,255}));
  connect(intSwi.u2, truDel.y)
    annotation (Line(points={{18,-50},{-34,-50},{-34,-40},{-58,-40}},
                                              color={255,0,255}));
  annotation (
    defaultComponentName="greAct",
  Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
        Line(
          points={{-80,-40},{-22,-40}},
          color={0,140,72},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{-82,60},{-46,38},{-6,42},{24,68},{64,46}},
          color={0,0,0},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{-84,18},{-48,-4},{-2,76},{44,36},{70,22}},
          color={0,0,0},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{-22,-40},{16,-40}},
          color={238,46,47},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{16,-40},{74,-40}},
          color={0,140,72},
          smooth=Smooth.None,
          thickness=1)}),
    Documentation(info="<html>
<p>
Block that verifies whether the input signals satisfy <code>u_max &ge; u_min</code>
when the signal <code>active</code> is <code>true</code>.
</p>
</html>", revisions="<html>
<ul>
<li>
December 20, 2024, by Michael Wetter:<br/>
Refactored to remove inequality test when the verification is inactive.
</li>
<li>
December 19, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"));
end GreaterEqual;
