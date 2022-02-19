within LinearRegressionUsingFeedbackControl;

model trainVersusTest
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanStep booleanStep1(startValue = true, startTime = 7) annotation(Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(visible = true, transformation(origin = {-150, 8.413}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y1 annotation(Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const.y, switch1.u3) annotation(Line(visible = true, origin = {-87.667, -19.333}, points = {{-11.333, -10.667}, {5.667, -10.667}, {5.667, 21.333}}, color = {1, 37, 163}));
  connect(booleanStep1.y, switch1.u2) annotation(Line(visible = true, origin = {-90.5, 10}, points = {{-8.5, 0}, {8.5, 0}}, color = {255, 0, 255}));
  connect(u1, switch1.u1) annotation(Line(visible = true, origin = {-127.333, 14.804}, points = {{-22.667, -6.391}, {-22.667, 3.196}, {45.333, 3.196}}, color = {1, 37, 163}));
  connect(switch1.y, y1) annotation(Line(visible = true, origin = {-44.5, 10}, points = {{-14.5, 0}, {14.5, 0}}, color = {1, 37, 163}));
  annotation(Diagram(coordinateSystem(extent = {{-150, -60}, {-20, 40}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 114, 195}, fillColor = {255, 255, 255}, extent = {{-100, -100}, {100, 100}}, radius = 25), Text(visible = true, textColor = {64, 64, 64}, extent = {{-150, 110}, {150, 150}}, textString = "%name")}));
end trainVersusTest;
