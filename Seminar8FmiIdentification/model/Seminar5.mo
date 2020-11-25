package Seminar5
  package Models
    model SpringMassSystem1Eq
      Real F1, F2;
      Real a "acceleration";
      Real v "velocity";
      Real y(start = 3) "displacement";
      Real d2y;
      parameter Real m = 10 "mass";
      parameter Real k = 5 "stiffness";
    equation
      F1 = m * a;
      F2 = -k * y;
      F1 = F2;
      a = d2y;
      d2y = der(v);
      v = der(y);
    end SpringMassSystem1Eq;

    model SprinMassSystemBlock2Eq
      Modelica.Blocks.Continuous.Integrator integrator annotation(
        Placement(visible = true, transformation(origin = {-52, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator2 annotation(
        Placement(visible = true, transformation(origin = {-50, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator1(y_start = 3) annotation(
        Placement(visible = true, transformation(origin = {8, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator3 annotation(
        Placement(visible = true, transformation(origin = {10, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain k1(k = 10) annotation(
        Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add Subtract(k1 = -1) annotation(
        Placement(visible = true, transformation(origin = {50, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain k2(k = 10) annotation(
        Placement(visible = true, transformation(origin = {82, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Gain gain(k = -1) annotation(
        Placement(visible = true, transformation(origin = {68, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Blocks.Sources.Constant m2(k = 7) annotation(
        Placement(visible = true, transformation(origin = {66, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Blocks.Math.Division Divide1 annotation(
        Placement(visible = true, transformation(origin = {30, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add add(k1 = -1, k2 = +1) annotation(
        Placement(visible = true, transformation(origin = {72, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Blocks.Math.Division division annotation(
        Placement(visible = true, transformation(origin = {-58, 78}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = 10) annotation(
        Placement(visible = true, transformation(origin = {-16, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    equation
      connect(integrator.y, integrator1.u) annotation(
        Line(points = {{-40, 40}, {-4, 40}, {-4, 40}, {-4, 40}}, color = {0, 0, 127}));
      connect(integrator1.y, k1.u) annotation(
        Line(points = {{20, 40}, {36, 40}, {36, 40}, {38, 40}}, color = {0, 0, 127}));
      connect(Subtract.u1, integrator1.y) annotation(
        Line(points = {{38, -8}, {28, -8}, {28, 40}, {20, 40}, {20, 40}}, color = {0, 0, 127}));
      connect(Subtract.y, k2.u) annotation(
        Line(points = {{62, -14}, {68, -14}, {68, -16}, {70, -16}}, color = {0, 0, 127}));
      connect(k2.y, gain.u) annotation(
        Line(points = {{94, -16}, {94, -16}, {94, -66}, {80, -66}, {80, -66}}, color = {0, 0, 127}));
      connect(gain.y, Divide1.u1) annotation(
        Line(points = {{56, -66}, {42, -66}, {42, -74}, {42, -74}}, color = {0, 0, 127}));
      connect(m2.y, Divide1.u2) annotation(
        Line(points = {{55, -92}, {44, -92}, {44, -86}, {42, -86}}, color = {0, 0, 127}));
      connect(Divide1.y, integrator2.u) annotation(
        Line(points = {{18, -80}, {-80, -80}, {-80, -32}, {-62, -32}, {-62, -32}}, color = {0, 0, 127}));
      connect(integrator2.y, integrator3.u) annotation(
        Line(points = {{-38, -32}, {-4, -32}, {-4, -32}, {-2, -32}}, color = {0, 0, 127}));
      connect(integrator3.y, Subtract.u2) annotation(
        Line(points = {{22, -32}, {28, -32}, {28, -20}, {38, -20}, {38, -20}}, color = {0, 0, 127}));
      connect(k1.y, add.u1) annotation(
        Line(points = {{62, 40}, {92, 40}, {92, 74}, {84, 74}, {84, 74}}, color = {0, 0, 127}));
      connect(k2.y, add.u2) annotation(
        Line(points = {{94, -16}, {96, -16}, {96, 86}, {84, 86}, {84, 86}}, color = {0, 0, 127}));
      connect(add.y, division.u1) annotation(
        Line(points = {{60, 80}, {42, 80}, {42, 96}, {-46, 96}, {-46, 84}, {-46, 84}}, color = {0, 0, 127}));
      connect(division.u2, const.y) annotation(
        Line(points = {{-46, 72}, {-28, 72}, {-28, 72}, {-26, 72}}, color = {0, 0, 127}));
      connect(division.y, integrator.u) annotation(
        Line(points = {{-68, 78}, {-90, 78}, {-90, 38}, {-64, 38}, {-64, 40}}, color = {0, 0, 127}));
    end SprinMassSystemBlock2Eq;

    model SpringMassComponent
      Seminar5.components.MechanicalFix mechanicalFix annotation(
        Placement(visible = true, transformation(origin = {-26, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      components.MechanicalSpring mechanicalSpring annotation(
        Placement(visible = true, transformation(origin = {-26, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      components.MechanicalMass mechanicalMass(initPos = 3, m = 1) annotation(
        Placement(visible = true, transformation(origin = {-26, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  components.MechanicalDump mechanicalDump annotation(
        Placement(visible = true, transformation(origin = {2, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(mechanicalMass.mechanicalJoint, mechanicalSpring.lowerJoint) annotation(
        Line(points = {{-26, 2}, {-26, 18}}));
      connect(mechanicalSpring.upperJoint, mechanicalFix.mechanicalJoint) annotation(
        Line(points = {{-26, 38}, {-26, 54}}));
  connect(mechanicalSpring.lowerJoint, mechanicalDump.j2) annotation(
        Line(points = {{-26, 18}, {2, 18}, {2, 16}}));
  connect(mechanicalSpring.upperJoint, mechanicalDump.j1) annotation(
        Line(points = {{-26, 38}, {2, 38}, {2, 36}}));
    protected
    end SpringMassComponent;
  end Models;

  package components
    connector MechanicalJoint
      Real y "position";
      flow Real F "force";
      annotation(
        Icon(graphics = {Rectangle(fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
    end MechanicalJoint;

    model MechanicalMass
      MechanicalJoint mechanicalJoint annotation(
        Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real y "position of the mass";
      parameter Real m "mass";
      parameter Real initPos = 0 "initial position";
      Real a "acceleration";
      Real v "velocity";
    initial equation
      y = initPos;
    equation
      mechanicalJoint.y = y;
      mechanicalJoint.F = m * a;
      v = der(y);
      a = der(v);
      annotation(
        Icon(graphics = {Ellipse(origin = {2, -4}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Sphere, extent = {{-98, 94}, {98, -94}}, endAngle = 360), Text(origin = {5, -4}, extent = {{-99, 38}, {99, -38}}, textString = "mass"), Text(origin = {0, -123}, extent = {{-100, 23}, {100, -23}}, textString = "m = %m")}));
    end MechanicalMass;

    model MechanicalSpring
      Real dy "displacement";
      parameter Real k = 10 "spring stiffness";
      MechanicalJoint upperJoint annotation(
        Placement(visible = true, transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      MechanicalJoint lowerJoint annotation(
        Placement(visible = true, transformation(origin = {2, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      lowerJoint.F = -k * dy;
      dy = upperJoint.y - lowerJoint.y;
      upperJoint.F + lowerJoint.F = 0;
      annotation(
        Icon(graphics = {Line(origin = {0.38, 0.15}, points = {{-0.383004, 97.855}, {-100.383, 59.855}, {99.617, 19.855}, {-100.383, -20.145}, {97.617, -58.145}, {-100.383, -80.145}, {1.617, -98.145}, {5.617, -98.145}}, thickness = 1, smooth = Smooth.Bezier), Text(origin = {-100, 2}, rotation = 270, extent = {{-136, 30}, {136, -30}}, textString = "k = %k")}));
    end MechanicalSpring;

    model MechanicalFix
      MechanicalJoint mechanicalJoint annotation(
        Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      mechanicalJoint.y = 0;
      annotation(
        Icon(graphics = {Rectangle(origin = {0, 30}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, extent = {{-100, 30}, {100, -30}})}));
    end MechanicalFix;

    model MechanicalSpringDump
      extends MechanicalSpring;
    equation

    end MechanicalSpringDump;

    model MechanicalDump
      MechanicalJoint j1 annotation(
        Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      MechanicalJoint j2 annotation(
        Placement(visible = true, transformation(origin = {0, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real y;
      Real F;
      Real v;
      parameter Real d = 1;
    equation
      y = j2.y - j1.y;
      v = der(y);
      F = -v * d;
      j1.F = F;
      j2.F + j1.F = 0;
      annotation(
        Icon(graphics = {Polygon(origin = {0, 45}, fillPattern = FillPattern.Solid, points = {{0, 45}, {0, -3}, {-60, -3}, {-60, -45}, {-56, -45}, {-56, -7}, {56, -7}, {56, -45}, {60, -45}, {60, -3}, {2, -3}, {2, 45}, {0, 45}}), Polygon(origin = {0, -34}, fillPattern = FillPattern.Solid, points = {{0, -54}, {0, 50}, {-54, 50}, {-54, 54}, {54, 54}, {54, 52}, {54, 50}, {2, 50}, {2, -54}, {0, -54}}), Text(origin = {-87, 10}, rotation = 270, extent = {{-131, 30}, {131, -30}}, textString = "d = %d")}));
    end MechanicalDump;
  end components;

  model springmasscomponent_based "system of springmass system, same as equation or block variants - but using basic components, no need to formulate complex ODE equations"
    components.MechanicalFix mechanicalFix1 annotation(
      Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    components.MechanicalSpring mechanicalSpring1 annotation(
      Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    components.MechanicalMass mechanicalMass1(initPos = 5, m = 10) annotation(
      Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    components.MechanicalSpring mechanicalSpring2 annotation(
      Placement(visible = true, transformation(origin = {0, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    components.MechanicalMass mechanicalMass2(m = 10) annotation(
      Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    components.MechanicalSpring mechanicalSpring3 annotation(
      Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    components.MechanicalMass mechanicalMass3(m = 2) annotation(
      Placement(visible = true, transformation(origin = {2, -126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    components.MechanicalDump mechanicalDump annotation(
      Placement(visible = true, transformation(origin = {34, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(mechanicalSpring3.lowerJoint, mechanicalMass3.mechanicalJoint) annotation(
      Line(points = {{0, -100}, {2, -100}, {2, -116}, {2, -116}}));
    connect(mechanicalMass2.mechanicalJoint, mechanicalSpring3.upperJoint) annotation(
      Line(points = {{0, -40}, {-22, -40}, {-22, -80}, {0, -80}, {0, -80}}));
    connect(mechanicalSpring2.lowerJoint, mechanicalMass2.mechanicalJoint) annotation(
      Line(points = {{0, -24}, {0, -24}, {0, -40}, {0, -40}}));
    connect(mechanicalMass1.mechanicalJoint, mechanicalSpring2.upperJoint) annotation(
      Line(points = {{0, 30}, {-26, 30}, {-26, -4}, {0, -4}, {0, -4}}));
    connect(mechanicalSpring1.lowerJoint, mechanicalMass1.mechanicalJoint) annotation(
      Line(points = {{0, 40}, {0, 40}, {0, 30}, {0, 30}}));
    connect(mechanicalFix1.mechanicalJoint, mechanicalSpring1.upperJoint) annotation(
      Line(points = {{0, 80}, {0, 80}, {0, 60}, {0, 60}}));
  end springmasscomponent_based;
  annotation(
    uses(Modelica(version = "3.2.3")));
end Seminar5;