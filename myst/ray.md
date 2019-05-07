
# Demistifying: Ray Tracing

Disclaimer this is only introductory and subtleties like the difference with path tracing will be omitted

It is currently a hott topic because nvidia launched RTX graphics cards

The technique was known for a long time but we didnt have the computing power to enable real time ray tracing rendering

# Traditional wae

Up to now the only feasible option was projective "graphix"
Like openGL, easy to parallelize: for each object, we "squeeze" several transformation matrices together and pass the coordinates of each point through them. (apply lighting..) We can then divide the coordinates of the point by z (their depth) to perform a perspective transform.

finally we get all our points in a unit cube and for each pixel we find the first triangle to that would intersect with this rectilinear ray. using kd trees, we can manage to identify the correct triangle pretty fast.

# Raytracing

In ray tracing we actually simulate the physical light interactions in a more truthful way:
For each pixel on our screen we shoot one (or several) beam at a given angle and find the first intersecting triangle. According to the surface characteristics we add to the beam some light intensity, and recursively compute the contribution from other beams hitting this point (reflected, refracted, or scattered)
Since each beams requires a special treatment, it becomes a much harder task for a GPU to parallelize.
(idk how nvidia pulled this off)  
Even Pixar and other animation companies run their rendering on CPUs.
Raytracing comes at a cost but offers much better results for shadows, diffraction and reflective surfaces.
Some solutions are merging the efficiency of openGL and raytracing to focus the computing power on more noticable things such as reflective surfaces.

# Tricks

In openGL, there is a lot of trickery, for bumpy surfaces and reflections, using shaders. For example when looking at a lake, some part of the light we see comes from a simulated camera that has opposite Z coordinate for position and angle. But these tricks are hard to merge together.
We also have cubemaps for reflective objects: part of their texture is a prerendered map of the surroundings (assumed not to change to much) and we can for negligible computing power offer decent reflection.

# Shapes

when ran on a CPU, we have lots of flexibility, because without parallization, we can deal with each ray in a unique way if we wanted to. Now this helps with shapes: where openGL needs a very canonical representation of an object, raytracing allows to play with spheres for example, and "their" way of interacting with light.
We have other functions to check for collisions and to compute the quantity of light transmitted, the direction of the reflected ray, etc. So we dont need to triangulate or serialize canonically every single object we want to display.