// RUN: mlir-opt %s | FileCheck %s

// Constants
// https://llvm.org/docs/LangRef.html#constants
func @ops_constant() {
// CHECK-LABEL: @ops_constant

  // CHECK-NEXT: %0 = llvm.constant(3 : i32) : !llvm.i32
  // CHECK-NEXT: %1 = llvm.constant(4.200000e+01 : f64) : !llvm.double
  // CHECK-NEXT: %2 = llvm.undef : !llvm<"{ i32, double, i32 }">
  %0 = llvm.constant(3 : i32) : !llvm.i32
  %1 = llvm.constant(4.200000e+01 : f64) : !llvm.double
  %2 = llvm.undef : !llvm<"{ i32, double, i32 }">

  llvm.return
}

// Terminator operations
// https://llvm.org/docs/LangRef.html#terminator-instructions
func @ops_terminator(%arg0 : !llvm.i1) {
// CHECK-LABEL: @ops_terminator

  // CHECK-NEXT: llvm.br ^bb1
  llvm.br ^bb1

// CHECK-NEXT: ^bb1:
^bb1:
  // CHECK-NEXT: llvm.cond_br %arg0, ^bb2, ^bb3
  llvm.cond_br %arg0, ^bb2, ^bb3

// CHECK-NEXT: ^bb2:
^bb2:
  // CHECK-NEXT: llvm.return
  llvm.return

// CHECK-NEXT: ^bb3:
^bb3:
  // CHECK-NEXT: llvm.return
  llvm.return
}

// Unary operations
// https://llvm.org/docs/LangRef.html#unary-operations
func @ops_unary() {
// CHECK-LABEL: @ops_unary

  llvm.return
}

// Binary operations
// https://llvm.org/docs/LangRef.html#binary-operations

// Integer binary operations.
func @ops_binary_int(%arg0 : !llvm.i32) {
// CHECK-LABEL: @ops_binary_int

  // CHECK-NEXT:  %0 = llvm.add %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %1 = llvm.sub %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %2 = llvm.mul %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %3 = llvm.udiv %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %4 = llvm.sdiv %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %5 = llvm.urem %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %6 = llvm.srem %arg0, %arg0 : !llvm.i32
  %0 = llvm.add %arg0, %arg0 : !llvm.i32
  %1 = llvm.sub %arg0, %arg0 : !llvm.i32
  %2 = llvm.mul %arg0, %arg0 : !llvm.i32
  %3 = llvm.udiv %arg0, %arg0 : !llvm.i32
  %4 = llvm.sdiv %arg0, %arg0 : !llvm.i32
  %5 = llvm.urem %arg0, %arg0 : !llvm.i32
  %6 = llvm.srem %arg0, %arg0 : !llvm.i32

  llvm.return
}

// Floating point binary operations.
func @ops_binary_float(%arg0 : !llvm.float) {
// CHECK-LABEL: @ops_binary_float

  // CHECK-NEXT:  %0 = llvm.fadd %arg0, %arg0 : !llvm.float
  // CHECK-NEXT:  %1 = llvm.fsub %arg0, %arg0 : !llvm.float
  // CHECK-NEXT:  %2 = llvm.fmul %arg0, %arg0 : !llvm.float
  // CHECK-NEXT:  %3 = llvm.fdiv %arg0, %arg0 : !llvm.float
  // CHECK-NEXT:  %4 = llvm.frem %arg0, %arg0 : !llvm.float
  %0 = llvm.fadd %arg0, %arg0 : !llvm.float
  %1 = llvm.fsub %arg0, %arg0 : !llvm.float
  %2 = llvm.fmul %arg0, %arg0 : !llvm.float
  %3 = llvm.fdiv %arg0, %arg0 : !llvm.float
  %4 = llvm.frem %arg0, %arg0 : !llvm.float

  llvm.return
}

// Bitwise binary ops
// https://llvm.org/docs/LangRef.html#bitwise-binary-operations
func @ops_bitwise_binary(%arg0 : !llvm.i32) {
// CHECK-LABEL: @ops_bitwise_binary
  // CHECK-NEXT:  %0 = llvm.shl %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %1 = llvm.lshr %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %2 = llvm.ashr %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %3 = llvm.and %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %4 = llvm.or %arg0, %arg0 : !llvm.i32
  // CHECK-NEXT:  %5 = llvm.xor %arg0, %arg0 : !llvm.i32
  %0 = llvm.shl %arg0, %arg0 : !llvm.i32
  %1 = llvm.lshr %arg0, %arg0 : !llvm.i32
  %2 = llvm.ashr %arg0, %arg0 : !llvm.i32
  %3 = llvm.and %arg0, %arg0 : !llvm.i32
  %4 = llvm.or %arg0, %arg0 : !llvm.i32
  %5 = llvm.xor %arg0, %arg0 : !llvm.i32

  llvm.return
}

// Vector Operations
// https://llvm.org/docs/LangRef.html#vector-operations
func @ops_vector() {
// CHECK-LABEL: @ops_vector

  llvm.return
}

// Aggregrate operations
// https://llvm.org/docs/LangRef.html#aggregate-operations
func @ops_aggregate(%arg0 : !llvm<"{ i32, double, i32 }">) {
// CHECK-LABEL: @ops_aggregate

  // CHECK-NEXT:  %0 = llvm.extractvalue %arg0[0] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %1 = llvm.insertvalue %0, %arg0[2] : !llvm<"{ i32, double, i32 }">
  %0 = llvm.extractvalue %arg0[0] : !llvm<"{ i32, double, i32 }">
  %1 = llvm.insertvalue %0, %arg0[2] : !llvm<"{ i32, double, i32 }">

  llvm.return
}

// Memory operations
// https://llvm.org/docs/LangRef.html#memory-access-and-addressing-operations
func @ops_memory(%arg0 : !llvm.i32) {
// CHECK-LABEL: @ops_memory

  // CHECK-NEXT:  %0 = llvm.alloca %arg0 x !llvm.double : (!llvm.i32) -> !llvm<"double*">
  // CHECK-NEXT:  %1 = llvm.getelementptr %0[%arg0, %arg0] : (!llvm<"double*">, !llvm.i32, !llvm.i32) -> !llvm<"double*">
  // CHECK-NEXT:  %2 = llvm.load %1 : !llvm<"double*">
  // CHECK-NEXT:  llvm.store %2, %1 : !llvm<"double*">
  %0 = llvm.alloca %arg0 x !llvm.double : (!llvm.i32) -> !llvm<"double*">
  %1 = llvm.getelementptr %0[%arg0, %arg0] : (!llvm<"double*">, !llvm.i32, !llvm.i32) -> !llvm<"double*">
  %2 = llvm.load %1 : !llvm<"double*">
  llvm.store %2, %1 : !llvm<"double*">

  llvm.return
}

// Conversion operations
// https://llvm.org/docs/LangRef.html#conversion-operations
func @ops_conversion(%arg0: !llvm.i32, %arg1: !llvm.i64,
  %arg2: !llvm<"<4 x i32>">, %arg3: !llvm<"<4 x i64>">,
  %arg4 : !llvm<"double*">, %arg5 : !llvm<"i32*">) {
// CHECK-LABEL: @ops_conversion

  // CHECK-NEXT: %0 = llvm.trunc %arg1 : !llvm.i64 to !llvm.i56
  // CHECK-NEXT: %1 = llvm.zext %arg0 : !llvm.i32 to !llvm.i64
  // CHECK-NEXT: %2 = llvm.sext %arg0 : !llvm.i32 to !llvm.i56
  %0 = llvm.trunc %arg1 : !llvm.i64 to !llvm.i56
  %1 = llvm.zext %arg0 : !llvm.i32 to !llvm.i64
  %2 = llvm.sext %arg0 : !llvm.i32 to !llvm.i56

  // CHECK-NEXT: %3 = llvm.trunc %arg3 : !llvm<"<4 x i64>"> to !llvm<"<4 x i56>">
  // CHECK-NEXT: %4 = llvm.sext %arg2 : !llvm<"<4 x i32>"> to !llvm<"<4 x i56>">
  // CHECK-NEXT: %5 = llvm.zext %arg2 : !llvm<"<4 x i32>"> to !llvm<"<4 x i64>">
  %3 = llvm.trunc %arg3 : !llvm<"<4 x i64>"> to !llvm<"<4 x i56>">
  %4 = llvm.sext %arg2 : !llvm<"<4 x i32>"> to !llvm<"<4 x i56>">
  %5 = llvm.zext %arg2 : !llvm<"<4 x i32>"> to !llvm<"<4 x i64>">

  // CHECK-NEXT:  %6 = llvm.ptrtoint %arg5 : !llvm<"i32*"> to !llvm.i32
  // CHECK-NEXT:  %7 = llvm.inttoptr %arg0 : !llvm.i32 to !llvm<"i32*">
  %6 = llvm.ptrtoint %arg5 : !llvm<"i32*"> to !llvm.i32
  %7 = llvm.inttoptr %arg0 : !llvm.i32 to !llvm<"i32*">

  // CHECK-NEXT:  %8 = llvm.bitcast %arg4 : !llvm<"double*"> to !llvm<"i64*">
  %8 = llvm.bitcast %arg4 : !llvm<"double*"> to !llvm<"i64*">

  llvm.return
}

// Other Operations
// https://llvm.org/docs/LangRef.html#other-operations
func @ops_other(%arg0 : !llvm.i32, %arg1 : !llvm.i1) {
// CHECK-LABEL: @ops_other

  // CHECK-NEXT:  %0 = llvm.icmp "ne" %arg0, %arg0 : !llvm.i32
  %0 = llvm.icmp "ne" %arg0, %arg0 : !llvm.i32

  // CHECK-NEXT:  %1 = llvm.select %arg1, %arg0, %arg0 : !llvm.i1, !llvm.i32
  %1 = llvm.select %arg1, %arg0, %arg0 : !llvm.i1, !llvm.i32

  // CHECK-NEXT:  %2 = llvm.call @foo(%arg0) : (!llvm.i32) -> !llvm<"{ i32, double, i32 }">
  %2 = llvm.call @foo(%arg0) : (!llvm.i32) -> !llvm<"{ i32, double, i32 }">

  // CHECK-NEXT:  %3 = llvm.constant(@foo) : !llvm<"{ i32, double, i32 } (i32)*">
  // CHECK-NEXT:  %4 = llvm.call %3(%arg0) : (!llvm.i32) -> !llvm<"{ i32, double, i32 }">
  %3 = llvm.constant(@foo) : !llvm<"{ i32, double, i32 } (i32)*">
  %4 = llvm.call %3(%arg0) : (!llvm.i32) -> !llvm<"{ i32, double, i32 }">

  llvm.return
}

//// An larger self-contained function.
// CHECK-LABEL:func @foo(%arg0: !llvm.i32) -> !llvm<"{ i32, double, i32 }"> {
func @foo(%arg0: !llvm.i32) -> !llvm<"{ i32, double, i32 }"> {
  // CHECK-NEXT:  %0 = llvm.constant(3 : i64) : !llvm.i32
  // CHECK-NEXT:  %1 = llvm.constant(3 : i64) : !llvm.i32
  // CHECK-NEXT:  %2 = llvm.constant(4.200000e+01 : f64) : !llvm.double
  // CHECK-NEXT:  %3 = llvm.constant(4.200000e+01 : f64) : !llvm.double
  // CHECK-NEXT:  %4 = llvm.add %0, %1 : !llvm.i32
  // CHECK-NEXT:  %5 = llvm.mul %4, %1 : !llvm.i32
  // CHECK-NEXT:  %6 = llvm.fadd %2, %3 : !llvm.double
  // CHECK-NEXT:  %7 = llvm.fsub %3, %6 : !llvm.double
  // CHECK-NEXT:  %8 = llvm.constant(1 : i64) : !llvm.i1
  // CHECK-NEXT:  llvm.cond_br %8, ^bb1(%4 : !llvm.i32), ^bb2(%4 : !llvm.i32)
  %0 = llvm.constant(3) : !llvm.i32
  %1 = llvm.constant(3) : !llvm.i32
  %2 = llvm.constant(4.200000e+01) : !llvm.double
  %3 = llvm.constant(4.200000e+01) : !llvm.double
  %4 = llvm.add %0, %1 : !llvm.i32
  %5 = llvm.mul %4, %1 : !llvm.i32
  %6 = llvm.fadd %2, %3 : !llvm.double
  %7 = llvm.fsub %3, %6 : !llvm.double
  %8 = llvm.constant(1) : !llvm.i1
  llvm.cond_br %8, ^bb1(%4 : !llvm.i32), ^bb2(%4 : !llvm.i32)

// CHECK-NEXT:^bb1(%9: !llvm.i32):
^bb1(%9: !llvm.i32):
  // CHECK-NEXT:  %10 = llvm.call @foo(%9) : (!llvm.i32) -> !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %11 = llvm.extractvalue %10[0] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %12 = llvm.extractvalue %10[1] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %13 = llvm.extractvalue %10[2] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %14 = llvm.undef : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %15 = llvm.insertvalue %5, %14[0] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %16 = llvm.insertvalue %7, %15[1] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %17 = llvm.insertvalue %11, %16[2] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  llvm.return %17 : !llvm<"{ i32, double, i32 }">
  %10 = llvm.call @foo(%9) : (!llvm.i32) -> !llvm<"{ i32, double, i32 }">
  %11 = llvm.extractvalue %10[0] : !llvm<"{ i32, double, i32 }">
  %12 = llvm.extractvalue %10[1] : !llvm<"{ i32, double, i32 }">
  %13 = llvm.extractvalue %10[2] : !llvm<"{ i32, double, i32 }">
  %14 = llvm.undef : !llvm<"{ i32, double, i32 }">
  %15 = llvm.insertvalue %5, %14[0] : !llvm<"{ i32, double, i32 }">
  %16 = llvm.insertvalue %7, %15[1] : !llvm<"{ i32, double, i32 }">
  %17 = llvm.insertvalue %11, %16[2] : !llvm<"{ i32, double, i32 }">
  llvm.return %17 : !llvm<"{ i32, double, i32 }">

// CHECK-NEXT:^bb2(%18: !llvm.i32):	// pred: ^bb0
^bb2(%18: !llvm.i32):	// pred: ^bb0
  // CHECK-NEXT:  %19 = llvm.undef : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %20 = llvm.insertvalue %18, %19[0] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %21 = llvm.insertvalue %7, %20[1] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  %22 = llvm.insertvalue %5, %21[2] : !llvm<"{ i32, double, i32 }">
  // CHECK-NEXT:  llvm.return %22 : !llvm<"{ i32, double, i32 }">
  %19 = llvm.undef : !llvm<"{ i32, double, i32 }">
  %20 = llvm.insertvalue %18, %19[0] : !llvm<"{ i32, double, i32 }">
  %21 = llvm.insertvalue %7, %20[1] : !llvm<"{ i32, double, i32 }">
  %22 = llvm.insertvalue %5, %21[2] : !llvm<"{ i32, double, i32 }">
  llvm.return %22 : !llvm<"{ i32, double, i32 }">
}
