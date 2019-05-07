

# Cube shadow

This is an odd topic, it is related to one problem of Google Codejam 2018.  
[Video from mathologer about it](https://www.youtube.com/watch?v=rAHcZGjKVvg)  
The statement goes as follow:
> If you project a cube onto a plane, the area of this projection is equal to the
the lenght of the projection onto the orthogonal vector space.

_need better phrasing_

why is that so ?
EASY

You will notice that the segment is the projection of 3 edges following each other,
from one corner to the opposite one.

and the area recieves contribution from only 3 faces.
the contribution of each face is the dot product of its normal vector with the light direction.

CQFD. same operation on both sides. More info on higher dimensions generalisation coming soon :)

_need illustrations_
