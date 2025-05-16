within Buildings_Requirements.BaseClasses;
block PartialSignalTestWhenActive
  "Partial model that verifies whether a signal satisfies a test when the component is active"
  extends Buildings_Requirements.BaseClasses.PartialRequirement;

  parameter Boolean use_activeInput = false
    "Set to true to enable an input that allows activating and deactivating the verification";
  parameter Modelica.Units.SI.Time delayTime = 0
    "Delay time used if use_activeInput = true. Set to value greater than 0 to delay when the test is done after active becomes true"
    annotation(Dialog(enable=use_activeInput));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput active
    if use_activeInput
    "Set to true if monitoring needs to be active" annotation (Placement(
        transformation(extent={{-140,-60},{-100,-20}}), iconTransformation(
          extent={{-140,-60},{-100,-20}})));

protected
  Buildings.Controls.OBC.CDL.Logical.TrueDelay truDel(
    final delayTime=delayTime)
    if use_activeInput
    "Optional delay for activation of verification"
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));

  Buildings.Controls.OBC.CDL.Logical.Sources.Constant act(
    final k=true)
    if not use_activeInput
    "Block that outputs true"
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));

  Modelica_Requirements.LogicalBlocks.IntegerToProperty ItoP1
    "Integer to property conversion"
    annotation (Placement(transformation(extent={{44,-60},{64,-40}})));
  Buildings.Controls.OBC.CDL.Conversions.BooleanToInteger booToInt(
    final integerTrue=3,
    final integerFalse=1)
      "Boolean to integer conversion"
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Buildings.Controls.OBC.CDL.Integers.Switch intSwi
    "Switch to allow for undecided"
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.Constant und(final k=2)
    "Output undecided as an integer"
    annotation (Placement(transformation(extent={{-60,-90},{-40,-70}})));
equation
  connect(ItoP1.u, intSwi.y)
    annotation (Line(points={{47,-50},{42,-50}},
                                             color={255,127,0}));
  connect(und.y, intSwi.u3) annotation (Line(points={{-38,-80},{0,-80},{0,-58},
          {18,-58}},color={255,127,0}));
  connect(booToInt.y, intSwi.u1) annotation (Line(points={{2,-30},{6,-30},{6,-42},
          {18,-42}},
                   color={255,127,0}));
  connect(ItoP1.y, req.property) annotation (Line(points={{60,-50},{72,-50},{72,
          -64},{20,-64},{20,-80},{30,-80}},
                                       color={255,0,128}));
  connect(truDel.u, active) annotation (Line(points={{-82,-40},{-120,-40}},
                      color={255,0,255}));
  annotation (
    defaultComponentName="reqWitBan",
  Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p>
Partial block that verifies whether the input signal <code>u</code> satisfies a test.
The block allows to either use or remove a boolean output <code>activate</code>
that can be used to enable or disable the verification, optionally with a delay.
This allows for example to verify whether a heating set point is met,
and activate the verification only after a certain delay time.
</p>
</html>", revisions="<html>
<ul>
<li>
May 16, 2025, by Michael Wetter:<br/>
Updated boolean conversion.</br>
This is for <a href=\"https://github.com/lbl-srg/modelica-buildings-requirements/issues/2\">issue 2</a>.
</li>
<li>
December 19, 2024, by Michael Wetter:<br/>
First implementation.
</li>
</html>"));
end PartialSignalTestWhenActive;
