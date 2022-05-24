vec4 mul(float a, vec4 X){
    return a * X;
}

vec4 mul(int a, vec4 X){
    return mul(float(a), X);
}

vec4 mul(vec4 X, vec4 Y){
    return vec4(X.x*Y.w + X.y*Y.z - X.z*Y.y + X.w*Y.x, -X.x*Y.z + X.y*Y.w + X.z*Y.x + X.w*Y.y, X.x*Y.y - X.y*Y.x + X.z*Y.w + X.w*Y.z, -X.x*Y.x - X.y*Y.y - X.z*Y.z + X.w*Y.w);
}

vec4 mul(vec4 X, vec4 Y, vec4 Z){
    return mul(mul(X, Y), Z);
}

vec4 involve(vec4 X){
    return vec4(-X.x, -X.y, X.z, X.w);
}

vec4 inner(vec4 X, vec4 Y){
    return vec4(X.y*Y.z - X.z*Y.y, -X.x*Y.z + X.z*Y.x, 0.0, -X.x*Y.x - X.y*Y.y - X.z*Y.z);
}

vec4 lcontract(vec4 X, vec4 Y){
    return vec4(X.y*Y.z + X.w*Y.x, -X.x*Y.z + X.w*Y.y, X.w*Y.z, -X.x*Y.x - X.y*Y.y - X.z*Y.z + X.w*Y.w);
}

vec4 outer(vec4 X, vec4 Y){
    return vec4(X.y*Y.w + X.w*Y.y, X.x*Y.y - X.y*Y.x + X.z*Y.w + X.w*Y.z, X.w*Y.w, X.x*Y.w + X.w*Y.x);
}

vec4 rcontract(vec4 X, vec4 Y){
    return vec4(X.x*Y.w - X.z*Y.y, X.y*Y.w + X.z*Y.x, X.z*Y.w, -X.x*Y.x - X.y*Y.y - X.z*Y.z + X.w*Y.w);
}

vec4 reverse(vec4 X){
    return vec4(X.x, X.y, -X.z, X.w);
}

vec4 conjugate(vec4 X){
    return reverse(involve(X));
}

vec4 outer(vec4 X, vec4 Y, vec4 Z){
    return outer(outer(X, Y), Z);
}

vec4 invert(vec4 X){
    return mul(1.0/lcontract(X,conjugate(X)).w, conjugate(X));
}

vec4 div(vec4 X, vec4 Y){
    return mul(X, invert(Y));
}

vec4 dual(vec4 X){
    return div(X, vec4(1,0,0,0));
}

vec4 moebius(vec4 x, vec4 A, vec4 B, vec4 C, vec4 D) {
    return div(mul(A, x) + B, mul(C, x) + D);
}

vec4 moebius(vec4 x, mat4 M) {
    return div(mul(M[0], x) + M[1], mul(M[2], x) + M[3]);
}
