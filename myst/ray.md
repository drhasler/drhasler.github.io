
Demistifying: Ray Tracing

Disclaimer this is only introductory and subtleties like the difference with path tracing will be omitted

It is currently a hott topic because nvidia launched RTX graphics cards

The technique was known for a long time but we didnt have the computing power to enable real time ray tracing rendering

Up to now the only feasible option was projective "graphix"
Like openGL, easy to parallelize: for each object, we "squeeze" several transformation matrices together and pass the coordinates of each point through them. We can then divide the coordinates of the point by z (their depth) to perform a perspective transform. 