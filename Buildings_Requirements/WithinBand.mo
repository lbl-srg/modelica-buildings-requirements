within Buildings_Requirements;
block WithinBand
  "Block that verifies whether a signal is within a lower and upper bound when the test is active"
  extends Buildings_Requirements.BaseClasses.PartialSignalTestWhenActive;

  parameter Real u_max "Upper threshold";
  parameter Real u_min "Lower threshold";

  Modelica.Blocks.Interfaces.RealInput u
    "Monitored quantity" annotation (
      Placement(transformation(extent={{-140,20},{-100,60}}),
        iconTransformation(extent={{-120,30},{-100,50}})));
  Modelica_Requirements.LogicalBlocks.WithinBand witBan(
    u_min = u_min,
    u_max = u_max) "Outputs true if input is within band"
    annotation (Placement(transformation(extent={{12,40},{52,60}})));

protected
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant con(
    final k=(u_max +u_min)/2)
    "Outputs constant value that is used when verification is inactive"
    annotation (Placement(transformation(extent={{-60,32},{-40,52}})));

  Buildings.Controls.OBC.CDL.Reals.Switch swi
    "Switch to disable activation of verification. This can avoid state events if the verification is inactive"
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Buildings.Controls.OBC.CDL.Reals.Switch swi1
    "Switch to disable activation of verification. This can avoid state events if the verification is inactive"
    annotation (Placement(transformation(extent={{22,80},{42,100}})));
protected
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant con1(final k=0)
    "Outputs constant value that is used when verification is inactive"
    annotation (Placement(transformation(extent={{-72,110},{-52,130}})));

public
  Buildings.Controls.OBC.CDL.Reals.AddParameter addPar(p=-u_max)
    annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
  Buildings.Controls.OBC.CDL.Reals.AddParameter addPar1(p=u_min)
    annotation (Placement(transformation(extent={{-28,80},{-8,100}})));
  Buildings.Controls.OBC.CDL.Reals.MultiplyByParameter gai(k=-1)
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  Buildings.Controls.OBC.CDL.Reals.Max max1
    annotation (Placement(transformation(extent={{-20,114},{0,134}})));
  Modelica.Blocks.Continuous.Integrator errConVio(k=1/3600)
    annotation (Placement(transformation(extent={{62,54},{82,74}})));
equation
  connect(truDel.y, swi.u2) annotation (Line(points={{-58,-40},{-34,-40},{-34,
          50},{-22,50}},
                color={255,0,255}));
  connect(swi.y, witBan.u)
    annotation (Line(points={{2,50},{10,50}}, color={0,0,127}));
  connect(swi.u1, u) annotation (Line(points={{-22,58},{-68,58},{-68,40},{-120,
          40}},
        color={0,0,127}));
  connect(act.y, swi.u2) annotation (Line(points={{-58,-10},{-30,-10},{-30,50},
          {-22,50}}, color={255,0,255}));
  connect(con.y, swi.u3)
    annotation (Line(points={{-38,42},{-22,42}}, color={0,0,127}));
  connect(act.y, intSwi.u2) annotation (Line(points={{-58,-10},{-30,-10},{-30,
          -50},{18,-50}}, color={255,0,255}));
  connect(intSwi.u2, truDel.y)
    annotation (Line(points={{18,-50},{-34,-50},{-34,-40},{-58,-40}},
                                              color={255,0,255}));
  connect(witBan.y, not1.u) annotation (Line(points={{53,50},{92,50},{92,10},{
          82,10}},
               color={255,0,255}));
  connect(swi.y, addPar.u) annotation (Line(points={{2,50},{2,74},{-60,74},{-60,
          86},{-102,86},{-102,70},{-92,70}}, color={0,0,127}));
  connect(gai.y, addPar1.u)
    annotation (Line(points={{-38,90},{-30,90}}, color={0,0,127}));
  connect(swi.y, gai.u) annotation (Line(points={{2,50},{-2,50},{-2,72},{-64,72},
          {-64,90},{-62,90}}, color={0,0,127}));
  connect(not2.y, swi1.u2) annotation (Line(points={{-1,10},{-2,10},{-2,34},{4,
          34},{4,90},{20,90}}, color={255,0,255}));
  connect(addPar1.y, max1.u1) annotation (Line(points={{-6,90},{2,90},{2,110},{
          -30,110},{-30,130},{-22,130}}, color={0,0,127}));
  connect(addPar.y, max1.u2) annotation (Line(points={{-68,70},{0,70},{0,76},{
          -2,76},{-2,98},{-4,98},{-4,108},{-22,108},{-22,118}}, color={0,0,127}));
  connect(max1.y, swi1.u3) annotation (Line(points={{2,124},{12,124},{12,82},{
          20,82}}, color={0,0,127}));
  connect(swi1.y, errConVio.u) annotation (Line(points={{44,90},{54,90},{54,74},
          {52,74},{52,64},{60,64}}, color={0,0,127}));
  connect(con1.y, swi1.u1) annotation (Line(points={{-50,120},{-42,120},{-42,
          122},{-32,122},{-32,142},{20,142},{20,98}}, color={0,0,127}));
  annotation (
    defaultComponentName="reqWitBan",
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
          points={{-18,-40},{0,-12},{6,22},{8,32},{16,40}},
          color={0,140,72},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{16,40},{36,56},{48,44},{52,40}},
          color={238,46,47},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{-18,-40},{-30,-54},{-46,-44},{-50,-40}},
          color={238,46,47},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{-50,-40},{-60,-24},{-66,-14}},
          color={0,140,72},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Line(
          points={{58,30},{56,34},{52,40}},
          color={0,140,72},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Text(
          extent={{-60,90},{52,60}},
          textColor={0,0,0},
          textString="%u_max"),
        Text(
          extent={{-62,-52},{50,-82}},
          textColor={0,0,0},
          textString="%u_min")}),
    Documentation(info="<html>
<p>
Block that verifies whether the input signal <code>u</code> is within the lower and upper bound
when the signal <code>active</code> is <code>true</code>.
</p>
</html>", revisions="<html>
<ul>
<li>
December 20, 2024, by Michael Wetter:<br/>
Refactored to remove inequality test when the verification is inactive.
This has shown to significantly reduce the number of state events during initialization.
</li>
<li>
December 19, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"));
end WithinBand;
