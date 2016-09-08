LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

MY_SRC_DIR := ../dep/WebKit/Source/JavaScriptCore
MY_GEN_DIR := ../gen/jsc

LOCAL_MODULE := jsc
LOCAL_STATIC_LIBRARIES := icuuc icui18n wtf
LOCAL_CFLAGS += \
	-D__STDC_LIMIT_MACROS \
	-DUSE_EXPORT_MACROS=1 \
	-DBUILDING_JavaScriptCore=1 \
	-DNDEBUG -O2
	
LOCAL_CPPFLAGS += -std=gnu++14
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/$(MY_SRC_DIR) \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/API \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/ForwardingHeaders \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/assembler \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/b3 \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/b3/air \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/bindings \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/builtins \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/bytecode \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/bytecompiler \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/dfg \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/disassembler \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/disassembler/udis86 \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/ftl \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/heap \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/debugger \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/inspector \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/inspector/agents \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/inspector/augmentable \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/inspector/remote \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/interpreter \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/jit \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/llint \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/parser \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/profiler \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/replay \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/runtime \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/tools \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/wasm \
    $(LOCAL_PATH)/$(MY_SRC_DIR)/yarr \
    $(LOCAL_PATH)/$(MY_GEN_DIR) \
    $(LOCAL_PATH)/$(MY_GEN_DIR)/inspector \
	$(LOCAL_PATH)/$(MY_GEN_DIR)/$(TARGET_ARCH_ABI) \

MY_GENERATED_SRC_FILES := \
    $(MY_GEN_DIR)/inspector/InspectorBackendDispatchers.cpp \
    $(MY_GEN_DIR)/inspector/InspectorFrontendDispatchers.cpp \
    $(MY_GEN_DIR)/inspector/InspectorProtocolObjects.cpp \
    $(MY_GEN_DIR)/JSCBuiltins.cpp \
    $(MY_GEN_DIR)/YarrCanonicalizeUnicode.cpp
    
MY_API_SRC_FILES := \
	$(MY_SRC_DIR)/API/JSBase.cpp \
	$(MY_SRC_DIR)/API/JSCallbackConstructor.cpp \
	$(MY_SRC_DIR)/API/JSCallbackFunction.cpp \
	$(MY_SRC_DIR)/API/JSCallbackObject.cpp \
	$(MY_SRC_DIR)/API/JSClassRef.cpp \
	$(MY_SRC_DIR)/API/JSContextRef.cpp \
	$(MY_SRC_DIR)/API/JSCTestRunnerUtils.cpp \
	$(MY_SRC_DIR)/API/JSObjectRef.cpp \
	$(MY_SRC_DIR)/API/JSScriptRef.cpp \
	$(MY_SRC_DIR)/API/JSStringRef.cpp \
	$(MY_SRC_DIR)/API/JSTypedArray.cpp \
	$(MY_SRC_DIR)/API/JSValueRef.cpp \
	$(MY_SRC_DIR)/API/JSWeakObjectMapRefPrivate.cpp \
	$(MY_SRC_DIR)/API/OpaqueJSString.cpp

MY_ASSEMBLER_SRC_FILES := \
	$(MY_SRC_DIR)/assembler/ARMAssembler.cpp \
	$(MY_SRC_DIR)/assembler/LinkBuffer.cpp \
	$(MY_SRC_DIR)/assembler/MacroAssembler.cpp \
	$(MY_SRC_DIR)/assembler/MacroAssemblerARM.cpp \
	$(MY_SRC_DIR)/assembler/MacroAssemblerARMv7.cpp \
	$(MY_SRC_DIR)/assembler/MacroAssemblerCodeRef.cpp \
	$(MY_SRC_DIR)/assembler/MacroAssemblerPrinter.cpp \
	$(MY_SRC_DIR)/assembler/MacroAssemblerX86Common.cpp

MY_B3_SRC_FILES := \
	$(MY_SRC_DIR)/b3/air/AirAllocateStack.cpp \
	$(MY_SRC_DIR)/b3/air/AirArg.cpp \
	$(MY_SRC_DIR)/b3/air/AirBasicBlock.cpp \
	$(MY_SRC_DIR)/b3/air/AirCCallSpecial.cpp \
	$(MY_SRC_DIR)/b3/air/AirCCallingConvention.cpp \
	$(MY_SRC_DIR)/b3/air/AirCode.cpp \
	$(MY_SRC_DIR)/b3/air/AirCustom.cpp \
	$(MY_SRC_DIR)/b3/air/AirDumpAsJS.cpp \
	$(MY_SRC_DIR)/b3/air/AirEliminateDeadCode.cpp \
	$(MY_SRC_DIR)/b3/air/AirEmitShuffle.cpp \
	$(MY_SRC_DIR)/b3/air/AirFixObviousSpills.cpp \
	$(MY_SRC_DIR)/b3/air/AirFixPartialRegisterStalls.cpp \
	$(MY_SRC_DIR)/b3/air/AirGenerate.cpp \
	$(MY_SRC_DIR)/b3/air/AirGenerated.cpp \
	$(MY_SRC_DIR)/b3/air/AirHandleCalleeSaves.cpp \
	$(MY_SRC_DIR)/b3/air/AirInsertionSet.cpp \
	$(MY_SRC_DIR)/b3/air/AirInst.cpp \
	$(MY_SRC_DIR)/b3/air/AirIteratedRegisterCoalescing.cpp \
	$(MY_SRC_DIR)/b3/air/AirLogRegisterPressure.cpp \
	$(MY_SRC_DIR)/b3/air/AirLowerAfterRegAlloc.cpp \
	$(MY_SRC_DIR)/b3/air/AirLowerEntrySwitch.cpp \
	$(MY_SRC_DIR)/b3/air/AirLowerMacros.cpp \
	$(MY_SRC_DIR)/b3/air/AirOptimizeBlockOrder.cpp \
	$(MY_SRC_DIR)/b3/air/AirPhaseScope.cpp \
	$(MY_SRC_DIR)/b3/air/AirRegisterPriority.cpp \
	$(MY_SRC_DIR)/b3/air/AirReportUsedRegisters.cpp \
	$(MY_SRC_DIR)/b3/air/AirSimplifyCFG.cpp \
	$(MY_SRC_DIR)/b3/air/AirSpecial.cpp \
	$(MY_SRC_DIR)/b3/air/AirSpillEverything.cpp \
	$(MY_SRC_DIR)/b3/air/AirStackSlot.cpp \
	$(MY_SRC_DIR)/b3/air/AirStackSlotKind.cpp \
	$(MY_SRC_DIR)/b3/air/AirTmp.cpp \
	$(MY_SRC_DIR)/b3/air/AirTmpWidth.cpp \
	$(MY_SRC_DIR)/b3/air/AirValidate.cpp \
	$(MY_SRC_DIR)/b3/B3ArgumentRegValue.cpp \
	$(MY_SRC_DIR)/b3/B3BasicBlock.cpp \
	$(MY_SRC_DIR)/b3/B3BlockInsertionSet.cpp \
	$(MY_SRC_DIR)/b3/B3BreakCriticalEdges.cpp \
	$(MY_SRC_DIR)/b3/B3CCallValue.cpp \
	$(MY_SRC_DIR)/b3/B3CaseCollection.cpp \
	$(MY_SRC_DIR)/b3/B3CheckSpecial.cpp \
	$(MY_SRC_DIR)/b3/B3CheckValue.cpp \
	$(MY_SRC_DIR)/b3/B3Common.cpp \
	$(MY_SRC_DIR)/b3/B3Commutativity.cpp \
	$(MY_SRC_DIR)/b3/B3Compilation.cpp \
	$(MY_SRC_DIR)/b3/B3Const32Value.cpp \
	$(MY_SRC_DIR)/b3/B3Const64Value.cpp \
	$(MY_SRC_DIR)/b3/B3ConstDoubleValue.cpp \
	$(MY_SRC_DIR)/b3/B3ConstFloatValue.cpp \
	$(MY_SRC_DIR)/b3/B3ConstrainedValue.cpp \
	$(MY_SRC_DIR)/b3/B3DataSection.cpp \
	$(MY_SRC_DIR)/b3/B3DuplicateTails.cpp \
	$(MY_SRC_DIR)/b3/B3Effects.cpp \
	$(MY_SRC_DIR)/b3/B3EliminateCommonSubexpressions.cpp \
	$(MY_SRC_DIR)/b3/B3FixSSA.cpp \
	$(MY_SRC_DIR)/b3/B3FoldPathConstants.cpp \
	$(MY_SRC_DIR)/b3/B3FrequencyClass.cpp \
	$(MY_SRC_DIR)/b3/B3Generate.cpp \
	$(MY_SRC_DIR)/b3/B3HeapRange.cpp \
	$(MY_SRC_DIR)/b3/B3InferSwitches.cpp \
	$(MY_SRC_DIR)/b3/B3InsertionSet.cpp \
	$(MY_SRC_DIR)/b3/B3LegalizeMemoryOffsets.cpp \
	$(MY_SRC_DIR)/b3/B3LowerMacros.cpp \
	$(MY_SRC_DIR)/b3/B3LowerMacrosAfterOptimizations.cpp \
	$(MY_SRC_DIR)/b3/B3LowerToAir.cpp \
	$(MY_SRC_DIR)/b3/B3MathExtras.cpp \
	$(MY_SRC_DIR)/b3/B3MemoryValue.cpp \
	$(MY_SRC_DIR)/b3/B3MoveConstants.cpp \
	$(MY_SRC_DIR)/b3/B3OpaqueByproducts.cpp \
	$(MY_SRC_DIR)/b3/B3Opcode.cpp \
	$(MY_SRC_DIR)/b3/B3Origin.cpp \
	$(MY_SRC_DIR)/b3/B3OriginDump.cpp \
	$(MY_SRC_DIR)/b3/B3PatchpointSpecial.cpp \
	$(MY_SRC_DIR)/b3/B3PatchpointValue.cpp \
	$(MY_SRC_DIR)/b3/B3PhaseScope.cpp \
	$(MY_SRC_DIR)/b3/B3PhiChildren.cpp \
	$(MY_SRC_DIR)/b3/B3Procedure.cpp \
	$(MY_SRC_DIR)/b3/B3PureCSE.cpp \
	$(MY_SRC_DIR)/b3/B3ReduceDoubleToFloat.cpp \
	$(MY_SRC_DIR)/b3/B3ReduceStrength.cpp \
	$(MY_SRC_DIR)/b3/B3SSACalculator.cpp \
	$(MY_SRC_DIR)/b3/B3SlotBaseValue.cpp \
	$(MY_SRC_DIR)/b3/B3StackmapGenerationParams.cpp \
	$(MY_SRC_DIR)/b3/B3StackmapSpecial.cpp \
	$(MY_SRC_DIR)/b3/B3StackmapValue.cpp \
	$(MY_SRC_DIR)/b3/B3StackSlot.cpp \
	$(MY_SRC_DIR)/b3/B3SwitchCase.cpp \
	$(MY_SRC_DIR)/b3/B3SwitchValue.cpp \
	$(MY_SRC_DIR)/b3/B3TimingScope.cpp \
	$(MY_SRC_DIR)/b3/B3Type.cpp \
	$(MY_SRC_DIR)/b3/B3UpsilonValue.cpp \
	$(MY_SRC_DIR)/b3/B3UseCounts.cpp \
	$(MY_SRC_DIR)/b3/B3Validate.cpp \
	$(MY_SRC_DIR)/b3/B3Value.cpp \
	$(MY_SRC_DIR)/b3/B3ValueKey.cpp \
	$(MY_SRC_DIR)/b3/B3ValueRep.cpp \
	$(MY_SRC_DIR)/b3/B3Variable.cpp \
	$(MY_SRC_DIR)/b3/B3VariableValue.cpp

MY_BINDING_SRC_FILES := \
	$(MY_SRC_DIR)/bindings/ScriptFunctionCall.cpp \
	$(MY_SRC_DIR)/bindings/ScriptObject.cpp \
	$(MY_SRC_DIR)/bindings/ScriptValue.cpp

MY_BUILTINS_SRC_FILES := \
	$(MY_SRC_DIR)/builtins/BuiltinExecutables.cpp \
	$(MY_SRC_DIR)/builtins/BuiltinExecutableCreator.cpp

MY_BYTECODE_SRC_FILES := \
	$(MY_SRC_DIR)/bytecode/AdaptiveInferredPropertyValueWatchpointBase.cpp \
	$(MY_SRC_DIR)/bytecode/ArithProfile.cpp \
	$(MY_SRC_DIR)/bytecode/ArrayAllocationProfile.cpp \
	$(MY_SRC_DIR)/bytecode/ArrayProfile.cpp \
	$(MY_SRC_DIR)/bytecode/BytecodeBasicBlock.cpp \
	$(MY_SRC_DIR)/bytecode/BytecodeGeneratorification.cpp \
	$(MY_SRC_DIR)/bytecode/BytecodeRewriter.cpp \
	$(MY_SRC_DIR)/bytecode/BytecodeIntrinsicRegistry.cpp \
	$(MY_SRC_DIR)/bytecode/BytecodeLivenessAnalysis.cpp \
	$(MY_SRC_DIR)/bytecode/CallEdge.cpp \
	$(MY_SRC_DIR)/bytecode/CallLinkInfo.cpp \
	$(MY_SRC_DIR)/bytecode/CallLinkStatus.cpp \
	$(MY_SRC_DIR)/bytecode/CallMode.cpp \
	$(MY_SRC_DIR)/bytecode/CallVariant.cpp \
	$(MY_SRC_DIR)/bytecode/CodeBlock.cpp \
	$(MY_SRC_DIR)/bytecode/CodeBlockHash.cpp \
	$(MY_SRC_DIR)/bytecode/CodeBlockJettisoningWatchpoint.cpp \
	$(MY_SRC_DIR)/bytecode/CodeOrigin.cpp \
	$(MY_SRC_DIR)/bytecode/CodeType.cpp \
	$(MY_SRC_DIR)/bytecode/ComplexGetStatus.cpp \
	$(MY_SRC_DIR)/bytecode/DataFormat.cpp \
	$(MY_SRC_DIR)/bytecode/DFGExitProfile.cpp \
	$(MY_SRC_DIR)/bytecode/DeferredCompilationCallback.cpp \
	$(MY_SRC_DIR)/bytecode/DeferredSourceDump.cpp \
	$(MY_SRC_DIR)/bytecode/ExecutionCounter.cpp \
	$(MY_SRC_DIR)/bytecode/ExitKind.cpp \
	$(MY_SRC_DIR)/bytecode/ExitingJITType.cpp \
	$(MY_SRC_DIR)/bytecode/GetByIdStatus.cpp \
	$(MY_SRC_DIR)/bytecode/GetByIdVariant.cpp \
	$(MY_SRC_DIR)/bytecode/InlineAccess.cpp \
	$(MY_SRC_DIR)/bytecode/InlineCallFrame.cpp \
	$(MY_SRC_DIR)/bytecode/InlineCallFrameSet.cpp \
	$(MY_SRC_DIR)/bytecode/JumpTable.cpp \
	$(MY_SRC_DIR)/bytecode/LLIntPrototypeLoadAdaptiveStructureWatchpoint.cpp \
	$(MY_SRC_DIR)/bytecode/LazyOperandValueProfile.cpp \
	$(MY_SRC_DIR)/bytecode/MethodOfGettingAValueProfile.cpp \
	$(MY_SRC_DIR)/bytecode/ObjectPropertyCondition.cpp \
	$(MY_SRC_DIR)/bytecode/ObjectPropertyConditionSet.cpp \
	$(MY_SRC_DIR)/bytecode/Opcode.cpp \
	$(MY_SRC_DIR)/bytecode/PolymorphicAccess.cpp \
	$(MY_SRC_DIR)/bytecode/PreciseJumpTargets.cpp \
	$(MY_SRC_DIR)/bytecode/PropertyCondition.cpp \
	$(MY_SRC_DIR)/bytecode/PutByIdFlags.cpp \
	$(MY_SRC_DIR)/bytecode/PutByIdStatus.cpp \
	$(MY_SRC_DIR)/bytecode/PutByIdVariant.cpp \
	$(MY_SRC_DIR)/bytecode/ReduceWhitespace.cpp \
	$(MY_SRC_DIR)/bytecode/SpecialPointer.cpp \
	$(MY_SRC_DIR)/bytecode/SpeculatedType.cpp \
	$(MY_SRC_DIR)/bytecode/StructureSet.cpp \
	$(MY_SRC_DIR)/bytecode/StructureStubClearingWatchpoint.cpp \
	$(MY_SRC_DIR)/bytecode/StructureStubInfo.cpp \
	$(MY_SRC_DIR)/bytecode/SuperSampler.cpp \
	$(MY_SRC_DIR)/bytecode/ToThisStatus.cpp \
	$(MY_SRC_DIR)/bytecode/TrackedReferences.cpp \
	$(MY_SRC_DIR)/bytecode/UnlinkedCodeBlock.cpp \
	$(MY_SRC_DIR)/bytecode/UnlinkedFunctionExecutable.cpp \
	$(MY_SRC_DIR)/bytecode/UnlinkedInstructionStream.cpp \
	$(MY_SRC_DIR)/bytecode/ValueRecovery.cpp \
	$(MY_SRC_DIR)/bytecode/VariableWriteFireDetail.cpp \
	$(MY_SRC_DIR)/bytecode/VirtualRegister.cpp \
	$(MY_SRC_DIR)/bytecode/Watchpoint.cpp

MY_BYTECOMPILER_SRC_FILES := \
	$(MY_SRC_DIR)/bytecompiler/BytecodeGenerator.cpp \
	$(MY_SRC_DIR)/bytecompiler/NodesCodegen.cpp

MY_DEBUGGER_SRC_FILES := \
	$(MY_SRC_DIR)/debugger/Debugger.cpp \
	$(MY_SRC_DIR)/debugger/DebuggerCallFrame.cpp \
	$(MY_SRC_DIR)/debugger/DebuggerLocation.cpp \
	$(MY_SRC_DIR)/debugger/DebuggerScope.cpp

MY_DFG_SRC_FILES := \
	$(MY_SRC_DIR)/dfg/DFGAbstractHeap.cpp \
	$(MY_SRC_DIR)/dfg/DFGAbstractValue.cpp \
	$(MY_SRC_DIR)/dfg/DFGAdaptiveInferredPropertyValueWatchpoint.cpp \
	$(MY_SRC_DIR)/dfg/DFGAdaptiveStructureWatchpoint.cpp \
	$(MY_SRC_DIR)/dfg/DFGArgumentsEliminationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGArgumentsUtilities.cpp \
	$(MY_SRC_DIR)/dfg/DFGArithMode.cpp \
	$(MY_SRC_DIR)/dfg/DFGArrayMode.cpp \
	$(MY_SRC_DIR)/dfg/DFGAtTailAbstractState.cpp \
	$(MY_SRC_DIR)/dfg/DFGAvailability.cpp \
	$(MY_SRC_DIR)/dfg/DFGAvailabilityMap.cpp \
	$(MY_SRC_DIR)/dfg/DFGBackwardsPropagationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGBasicBlock.cpp \
	$(MY_SRC_DIR)/dfg/DFGBlockInsertionSet.cpp \
	$(MY_SRC_DIR)/dfg/DFGBlockSet.cpp \
	$(MY_SRC_DIR)/dfg/DFGByteCodeParser.cpp \
	$(MY_SRC_DIR)/dfg/DFGCFAPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGCFGSimplificationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGCPSRethreadingPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGCSEPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGCapabilities.cpp \
	$(MY_SRC_DIR)/dfg/DFGCleanUpPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGClobberSet.cpp \
	$(MY_SRC_DIR)/dfg/DFGClobberize.cpp \
	$(MY_SRC_DIR)/dfg/DFGClobbersExitState.cpp \
	$(MY_SRC_DIR)/dfg/DFGCombinedLiveness.cpp \
	$(MY_SRC_DIR)/dfg/DFGCommon.cpp \
	$(MY_SRC_DIR)/dfg/DFGCommonData.cpp \
	$(MY_SRC_DIR)/dfg/DFGCompilationKey.cpp \
	$(MY_SRC_DIR)/dfg/DFGCompilationMode.cpp \
	$(MY_SRC_DIR)/dfg/DFGConstantFoldingPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGConstantHoistingPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGCriticalEdgeBreakingPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGDCEPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGDesiredIdentifiers.cpp \
	$(MY_SRC_DIR)/dfg/DFGDesiredTransitions.cpp \
	$(MY_SRC_DIR)/dfg/DFGDesiredWatchpoints.cpp \
	$(MY_SRC_DIR)/dfg/DFGDesiredWeakReferences.cpp \
	$(MY_SRC_DIR)/dfg/DFGDisassembler.cpp \
	$(MY_SRC_DIR)/dfg/DFGDoesGC.cpp \
	$(MY_SRC_DIR)/dfg/DFGDriver.cpp \
	$(MY_SRC_DIR)/dfg/DFGEdge.cpp \
	$(MY_SRC_DIR)/dfg/DFGEpoch.cpp \
	$(MY_SRC_DIR)/dfg/DFGFailedFinalizer.cpp \
	$(MY_SRC_DIR)/dfg/DFGFinalizer.cpp \
	$(MY_SRC_DIR)/dfg/DFGFixupPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGFlushFormat.cpp \
	$(MY_SRC_DIR)/dfg/DFGFlushedAt.cpp \
	$(MY_SRC_DIR)/dfg/DFGLiveCatchVariablePreservationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGFrozenValue.cpp \
	$(MY_SRC_DIR)/dfg/DFGGraph.cpp \
	$(MY_SRC_DIR)/dfg/DFGGraphSafepoint.cpp \
	$(MY_SRC_DIR)/dfg/DFGHeapLocation.cpp \
	$(MY_SRC_DIR)/dfg/DFGInPlaceAbstractState.cpp \
	$(MY_SRC_DIR)/dfg/DFGInferredTypeCheck.cpp \
	$(MY_SRC_DIR)/dfg/DFGInsertionSet.cpp \
	$(MY_SRC_DIR)/dfg/DFGIntegerCheckCombiningPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGIntegerRangeOptimizationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGInvalidationPointInjectionPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGJITCode.cpp \
	$(MY_SRC_DIR)/dfg/DFGJITCompiler.cpp \
	$(MY_SRC_DIR)/dfg/DFGJITFinalizer.cpp \
	$(MY_SRC_DIR)/dfg/DFGJumpReplacement.cpp \
	$(MY_SRC_DIR)/dfg/DFGLICMPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGLazyJSValue.cpp \
	$(MY_SRC_DIR)/dfg/DFGLazyNode.cpp \
	$(MY_SRC_DIR)/dfg/DFGLivenessAnalysisPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGLongLivedState.cpp \
	$(MY_SRC_DIR)/dfg/DFGLoopPreHeaderCreationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGMaximalFlushInsertionPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGMayExit.cpp \
	$(MY_SRC_DIR)/dfg/DFGMinifiedGraph.cpp \
	$(MY_SRC_DIR)/dfg/DFGMinifiedNode.cpp \
	$(MY_SRC_DIR)/dfg/DFGMovHintRemovalPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGMultiGetByOffsetData.cpp \
	$(MY_SRC_DIR)/dfg/DFGNaturalLoops.cpp \
	$(MY_SRC_DIR)/dfg/DFGNode.cpp \
	$(MY_SRC_DIR)/dfg/DFGNodeFlags.cpp \
	$(MY_SRC_DIR)/dfg/DFGNodeOrigin.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRAvailabilityAnalysisPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSREntry.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSREntrypointCreationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRExit.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRExitBase.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRExitCompiler.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRExitCompiler32_64.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRExitCompiler64.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRExitCompilerCommon.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRExitFuzz.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRExitJumpPlaceholder.cpp \
	$(MY_SRC_DIR)/dfg/DFGOSRExitPreparation.cpp \
	$(MY_SRC_DIR)/dfg/DFGObjectAllocationSinkingPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGObjectMaterializationData.cpp \
	$(MY_SRC_DIR)/dfg/DFGOperations.cpp \
	$(MY_SRC_DIR)/dfg/DFGPhantomInsertionPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGPhiChildren.cpp \
	$(MY_SRC_DIR)/dfg/DFGPlan.cpp \
	$(MY_SRC_DIR)/dfg/DFGPrePostNumbering.cpp \
	$(MY_SRC_DIR)/dfg/DFGPredictionInjectionPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGPredictionPropagationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGPromotedHeapLocation.cpp \
	$(MY_SRC_DIR)/dfg/DFGPureValue.cpp \
	$(MY_SRC_DIR)/dfg/DFGPutStackSinkingPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGSSACalculator.cpp \
	$(MY_SRC_DIR)/dfg/DFGSSAConversionPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGSSALoweringPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGSafepoint.cpp \
	$(MY_SRC_DIR)/dfg/DFGSpeculativeJIT.cpp \
	$(MY_SRC_DIR)/dfg/DFGSpeculativeJIT32_64.cpp \
	$(MY_SRC_DIR)/dfg/DFGSpeculativeJIT64.cpp \
	$(MY_SRC_DIR)/dfg/DFGStackLayoutPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGStaticExecutionCountEstimationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGStoreBarrierInsertionPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGStrengthReductionPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGStructureAbstractValue.cpp \
	$(MY_SRC_DIR)/dfg/DFGStructureRegistrationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGThreadData.cpp \
	$(MY_SRC_DIR)/dfg/DFGThunks.cpp \
	$(MY_SRC_DIR)/dfg/DFGTierUpCheckInjectionPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGToFTLDeferredCompilationCallback.cpp \
	$(MY_SRC_DIR)/dfg/DFGToFTLForOSREntryDeferredCompilationCallback.cpp \
	$(MY_SRC_DIR)/dfg/DFGTransition.cpp \
	$(MY_SRC_DIR)/dfg/DFGTypeCheckHoistingPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGUnificationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGUseKind.cpp \
	$(MY_SRC_DIR)/dfg/DFGValidate.cpp \
	$(MY_SRC_DIR)/dfg/DFGValueSource.cpp \
	$(MY_SRC_DIR)/dfg/DFGValueStrength.cpp \
	$(MY_SRC_DIR)/dfg/DFGVarargsForwardingPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGVariableAccessData.cpp \
	$(MY_SRC_DIR)/dfg/DFGVariableAccessDataDump.cpp \
	$(MY_SRC_DIR)/dfg/DFGVariableEvent.cpp \
	$(MY_SRC_DIR)/dfg/DFGVariableEventStream.cpp \
	$(MY_SRC_DIR)/dfg/DFGVirtualRegisterAllocationPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGWatchpointCollectionPhase.cpp \
	$(MY_SRC_DIR)/dfg/DFGWorklist.cpp

MY_DISASSEMBLER_SRC_FILES := \
	$(MY_SRC_DIR)/disassembler/ARM64Disassembler.cpp \
	$(MY_SRC_DIR)/disassembler/ARMLLVMDisassembler.cpp \
	$(MY_SRC_DIR)/disassembler/ARMv7Disassembler.cpp \
	$(MY_SRC_DIR)/disassembler/Disassembler.cpp \
	$(MY_SRC_DIR)/disassembler/UDis86Disassembler.cpp \
	$(MY_SRC_DIR)/disassembler/X86Disassembler.cpp \
	$(MY_SRC_DIR)/disassembler/ARM64/A64DOpcode.cpp \
	$(MY_SRC_DIR)/disassembler/ARMv7/ARMv7DOpcode.cpp

MY_FTL_SRC_FILES := \
	$(MY_SRC_DIR)/ftl/FTLAbstractHeap.cpp \
	$(MY_SRC_DIR)/ftl/FTLAbstractHeapRepository.cpp \
	$(MY_SRC_DIR)/ftl/FTLAvailableRecovery.cpp \
	$(MY_SRC_DIR)/ftl/FTLCapabilities.cpp \
	$(MY_SRC_DIR)/ftl/FTLCommonValues.cpp \
	$(MY_SRC_DIR)/ftl/FTLCompile.cpp \
	$(MY_SRC_DIR)/ftl/FTLExceptionTarget.cpp \
	$(MY_SRC_DIR)/ftl/FTLExitArgument.cpp \
	$(MY_SRC_DIR)/ftl/FTLExitArgumentForOperand.cpp \
	$(MY_SRC_DIR)/ftl/FTLExitPropertyValue.cpp \
	$(MY_SRC_DIR)/ftl/FTLExitTimeObjectMaterialization.cpp \
	$(MY_SRC_DIR)/ftl/FTLExitValue.cpp \
	$(MY_SRC_DIR)/ftl/FTLFail.cpp \
	$(MY_SRC_DIR)/ftl/FTLForOSREntryJITCode.cpp \
	$(MY_SRC_DIR)/ftl/FTLJITCode.cpp \
	$(MY_SRC_DIR)/ftl/FTLJITFinalizer.cpp \
	$(MY_SRC_DIR)/ftl/FTLLazySlowPath.cpp \
	$(MY_SRC_DIR)/ftl/FTLLink.cpp \
	$(MY_SRC_DIR)/ftl/FTLLocation.cpp \
	$(MY_SRC_DIR)/ftl/FTLLowerDFGToB3.cpp \
	$(MY_SRC_DIR)/ftl/FTLOSREntry.cpp \
	$(MY_SRC_DIR)/ftl/FTLOSRExit.cpp \
	$(MY_SRC_DIR)/ftl/FTLOSRExitCompiler.cpp \
	$(MY_SRC_DIR)/ftl/FTLOSRExitHandle.cpp \
	$(MY_SRC_DIR)/ftl/FTLOperations.cpp \
	$(MY_SRC_DIR)/ftl/FTLOutput.cpp \
	$(MY_SRC_DIR)/ftl/FTLPatchpointExceptionHandle.cpp \
	$(MY_SRC_DIR)/ftl/FTLRecoveryOpcode.cpp \
	$(MY_SRC_DIR)/ftl/FTLSaveRestore.cpp \
	$(MY_SRC_DIR)/ftl/FTLSlowPathCall.cpp \
	$(MY_SRC_DIR)/ftl/FTLSlowPathCallKey.cpp \
	$(MY_SRC_DIR)/ftl/FTLState.cpp \
	$(MY_SRC_DIR)/ftl/FTLThunks.cpp \
	$(MY_SRC_DIR)/ftl/FTLValueRange.cpp

MY_HEAP_SRC_FILES := \
	$(MY_SRC_DIR)/heap/AllocatorAttributes.cpp \
	$(MY_SRC_DIR)/heap/CodeBlockSet.cpp \
	$(MY_SRC_DIR)/heap/ConservativeRoots.cpp \
	$(MY_SRC_DIR)/heap/CopiedBlock.cpp \
	$(MY_SRC_DIR)/heap/CopiedSpace.cpp \
	$(MY_SRC_DIR)/heap/CopyVisitor.cpp \
	$(MY_SRC_DIR)/heap/DeferGC.cpp \
	$(MY_SRC_DIR)/heap/DestructionMode.cpp \
	$(MY_SRC_DIR)/heap/EdenGCActivityCallback.cpp \
	$(MY_SRC_DIR)/heap/FullGCActivityCallback.cpp \
	$(MY_SRC_DIR)/heap/FreeList.cpp \
	$(MY_SRC_DIR)/heap/GCActivityCallback.cpp \
	$(MY_SRC_DIR)/heap/GCLogging.cpp \
	$(MY_SRC_DIR)/heap/HandleSet.cpp \
	$(MY_SRC_DIR)/heap/HandleStack.cpp \
	$(MY_SRC_DIR)/heap/Heap.cpp \
	$(MY_SRC_DIR)/heap/HeapCell.cpp \
	$(MY_SRC_DIR)/heap/HeapHelperPool.cpp \
	$(MY_SRC_DIR)/heap/HeapOperation.cpp \
	$(MY_SRC_DIR)/heap/HeapProfiler.cpp \
	$(MY_SRC_DIR)/heap/HeapSnapshot.cpp \
	$(MY_SRC_DIR)/heap/HeapSnapshotBuilder.cpp \
	$(MY_SRC_DIR)/heap/HeapStatistics.cpp \
	$(MY_SRC_DIR)/heap/HeapTimer.cpp \
	$(MY_SRC_DIR)/heap/HeapVerifier.cpp \
	$(MY_SRC_DIR)/heap/IncrementalSweeper.cpp \
	$(MY_SRC_DIR)/heap/JITStubRoutineSet.cpp \
	$(MY_SRC_DIR)/heap/LargeAllocation.cpp \
	$(MY_SRC_DIR)/heap/LiveObjectList.cpp \
	$(MY_SRC_DIR)/heap/MachineStackMarker.cpp \
	$(MY_SRC_DIR)/heap/MarkStack.cpp \
	$(MY_SRC_DIR)/heap/MarkedAllocator.cpp \
	$(MY_SRC_DIR)/heap/MarkedBlock.cpp \
	$(MY_SRC_DIR)/heap/MarkedSpace.cpp \
	$(MY_SRC_DIR)/heap/SlotVisitor.cpp \
	$(MY_SRC_DIR)/heap/Weak.cpp \
	$(MY_SRC_DIR)/heap/WeakBlock.cpp \
	$(MY_SRC_DIR)/heap/WeakHandleOwner.cpp \
	$(MY_SRC_DIR)/heap/WeakSet.cpp \
	$(MY_SRC_DIR)/heap/WriteBarrierBuffer.cpp \
	$(MY_SRC_DIR)/heap/WriteBarrierSupport.cpp

MY_INSPECTOR_SRC_FILES := \
	$(MY_SRC_DIR)/inspector/ConsoleMessage.cpp \
	$(MY_SRC_DIR)/inspector/ContentSearchUtilities.cpp \
	$(MY_SRC_DIR)/inspector/EventLoop.cpp \
	$(MY_SRC_DIR)/inspector/IdentifiersFactory.cpp \
	$(MY_SRC_DIR)/inspector/InjectedScript.cpp \
	$(MY_SRC_DIR)/inspector/InjectedScriptBase.cpp \
	$(MY_SRC_DIR)/inspector/InjectedScriptHost.cpp \
	$(MY_SRC_DIR)/inspector/InjectedScriptManager.cpp \
	$(MY_SRC_DIR)/inspector/InjectedScriptModule.cpp \
	$(MY_SRC_DIR)/inspector/InspectorAgentRegistry.cpp \
	$(MY_SRC_DIR)/inspector/InspectorFrontendRouter.cpp \
	$(MY_SRC_DIR)/inspector/InspectorBackendDispatcher.cpp \
	$(MY_SRC_DIR)/inspector/InspectorValues.cpp \
	$(MY_SRC_DIR)/inspector/JSGlobalObjectConsoleClient.cpp \
	$(MY_SRC_DIR)/inspector/JSGlobalObjectInspectorController.cpp \
	$(MY_SRC_DIR)/inspector/JSGlobalObjectScriptDebugServer.cpp \
	$(MY_SRC_DIR)/inspector/JSInjectedScriptHost.cpp \
	$(MY_SRC_DIR)/inspector/JSInjectedScriptHostPrototype.cpp \
	$(MY_SRC_DIR)/inspector/JSJavaScriptCallFrame.cpp \
	$(MY_SRC_DIR)/inspector/JSJavaScriptCallFramePrototype.cpp \
	$(MY_SRC_DIR)/inspector/JavaScriptCallFrame.cpp \
	$(MY_SRC_DIR)/inspector/PerGlobalObjectWrapperWorld.cpp \
	$(MY_SRC_DIR)/inspector/ScriptArguments.cpp \
	$(MY_SRC_DIR)/inspector/ScriptCallFrame.cpp \
	$(MY_SRC_DIR)/inspector/ScriptCallStack.cpp \
	$(MY_SRC_DIR)/inspector/ScriptCallStackFactory.cpp \
	$(MY_SRC_DIR)/inspector/ScriptDebugServer.cpp \
	$(MY_SRC_DIR)/inspector/agents/InspectorAgent.cpp \
	$(MY_SRC_DIR)/inspector/agents/InspectorConsoleAgent.cpp \
	$(MY_SRC_DIR)/inspector/agents/InspectorDebuggerAgent.cpp \
	$(MY_SRC_DIR)/inspector/agents/InspectorHeapAgent.cpp \
	$(MY_SRC_DIR)/inspector/agents/InspectorRuntimeAgent.cpp \
	$(MY_SRC_DIR)/inspector/agents/InspectorScriptProfilerAgent.cpp \
	$(MY_SRC_DIR)/inspector/agents/JSGlobalObjectConsoleAgent.cpp \
	$(MY_SRC_DIR)/inspector/agents/JSGlobalObjectDebuggerAgent.cpp \
	$(MY_SRC_DIR)/inspector/agents/JSGlobalObjectRuntimeAgent.cpp

MY_INTERPRETER_SRC_FILES := \
	$(MY_SRC_DIR)/interpreter/AbstractPC.cpp \
	$(MY_SRC_DIR)/interpreter/CLoopStack.cpp \
	$(MY_SRC_DIR)/interpreter/CallFrame.cpp \
	$(MY_SRC_DIR)/interpreter/Interpreter.cpp \
	$(MY_SRC_DIR)/interpreter/ProtoCallFrame.cpp \
	$(MY_SRC_DIR)/interpreter/ShadowChicken.cpp \
	$(MY_SRC_DIR)/interpreter/StackVisitor.cpp

MY_JIT_SRC_FILES := \
	$(MY_SRC_DIR)/jit/AssemblyHelpers.cpp \
	$(MY_SRC_DIR)/jit/BinarySwitch.cpp \
	$(MY_SRC_DIR)/jit/CCallHelpers.cpp \
	$(MY_SRC_DIR)/jit/CachedRecovery.cpp \
	$(MY_SRC_DIR)/jit/CallFrameShuffleData.cpp \
	$(MY_SRC_DIR)/jit/CallFrameShuffler.cpp \
	$(MY_SRC_DIR)/jit/CallFrameShuffler32_64.cpp \
	$(MY_SRC_DIR)/jit/CallFrameShuffler64.cpp \
	$(MY_SRC_DIR)/jit/ExecutableAllocationFuzz.cpp \
	$(MY_SRC_DIR)/jit/ExecutableAllocator.cpp \
	$(MY_SRC_DIR)/jit/ExecutableAllocatorFixedVMPool.cpp \
	$(MY_SRC_DIR)/jit/GCAwareJITStubRoutine.cpp \
	$(MY_SRC_DIR)/jit/GPRInfo.cpp \
	$(MY_SRC_DIR)/jit/HostCallReturnValue.cpp \
	$(MY_SRC_DIR)/jit/ICStats.cpp \
	$(MY_SRC_DIR)/jit/IntrinsicEmitter.cpp \
	$(MY_SRC_DIR)/jit/JIT.cpp \
	$(MY_SRC_DIR)/jit/JITAddGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITArithmetic.cpp \
	$(MY_SRC_DIR)/jit/JITArithmetic32_64.cpp \
	$(MY_SRC_DIR)/jit/JITBitAndGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITBitOrGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITBitXorGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITCall.cpp \
	$(MY_SRC_DIR)/jit/JITCall32_64.cpp \
	$(MY_SRC_DIR)/jit/JITCode.cpp \
	$(MY_SRC_DIR)/jit/JITDisassembler.cpp \
	$(MY_SRC_DIR)/jit/JITDivGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITExceptions.cpp \
	$(MY_SRC_DIR)/jit/JITInlineCacheGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITLeftShiftGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITMulGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITNegGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITOpcodes.cpp \
	$(MY_SRC_DIR)/jit/JITOpcodes32_64.cpp \
	$(MY_SRC_DIR)/jit/JITOperations.cpp \
	$(MY_SRC_DIR)/jit/JITPropertyAccess.cpp \
	$(MY_SRC_DIR)/jit/JITPropertyAccess32_64.cpp \
	$(MY_SRC_DIR)/jit/JITRightShiftGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITStubRoutine.cpp \
	$(MY_SRC_DIR)/jit/JITSubGenerator.cpp \
	$(MY_SRC_DIR)/jit/JITThunks.cpp \
	$(MY_SRC_DIR)/jit/JITToDFGDeferredCompilationCallback.cpp \
	$(MY_SRC_DIR)/jit/JITWorklist.cpp \
	$(MY_SRC_DIR)/jit/PCToCodeOriginMap.cpp \
	$(MY_SRC_DIR)/jit/PolymorphicCallStubRoutine.cpp \
	$(MY_SRC_DIR)/jit/Reg.cpp \
	$(MY_SRC_DIR)/jit/RegisterAtOffset.cpp \
	$(MY_SRC_DIR)/jit/RegisterAtOffsetList.cpp \
	$(MY_SRC_DIR)/jit/RegisterSet.cpp \
	$(MY_SRC_DIR)/jit/Repatch.cpp \
	$(MY_SRC_DIR)/jit/ScratchRegisterAllocator.cpp \
	$(MY_SRC_DIR)/jit/SetupVarargsFrame.cpp \
	$(MY_SRC_DIR)/jit/TagRegistersMode.cpp \
	$(MY_SRC_DIR)/jit/TempRegisterSet.cpp \
	$(MY_SRC_DIR)/jit/ThunkGenerators.cpp

MY_LLINT_SRC_FILES := \
	$(MY_SRC_DIR)/llint/LLIntCLoop.cpp \
	$(MY_SRC_DIR)/llint/LLIntData.cpp \
	$(MY_SRC_DIR)/llint/LLIntEntrypoint.cpp \
	$(MY_SRC_DIR)/llint/LLIntExceptions.cpp \
	$(MY_SRC_DIR)/llint/LLIntSlowPaths.cpp \
	$(MY_SRC_DIR)/llint/LLIntThunks.cpp \
	$(MY_SRC_DIR)/llint/LowLevelInterpreter.cpp

MY_PARSER_SRC_FILES := \
	$(MY_SRC_DIR)/parser/Lexer.cpp \
	$(MY_SRC_DIR)/parser/ModuleAnalyzer.cpp \
	$(MY_SRC_DIR)/parser/Nodes.cpp \
	$(MY_SRC_DIR)/parser/NodesAnalyzeModule.cpp \
	$(MY_SRC_DIR)/parser/Parser.cpp \
	$(MY_SRC_DIR)/parser/ParserArena.cpp \
	$(MY_SRC_DIR)/parser/SourceCode.cpp \
	$(MY_SRC_DIR)/parser/SourceProvider.cpp \
	$(MY_SRC_DIR)/parser/SourceProviderCache.cpp \
	$(MY_SRC_DIR)/parser/VariableEnvironment.cpp

MY_PROFILER_SRC_FILES := \
	$(MY_SRC_DIR)/profiler/ProfilerBytecode.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerBytecodeSequence.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerBytecodes.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerCompilation.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerCompilationKind.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerCompiledBytecode.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerDatabase.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerEvent.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerJettisonReason.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerOSRExit.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerOSRExitSite.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerOrigin.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerOriginStack.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerProfiledBytecodes.cpp \
	$(MY_SRC_DIR)/profiler/ProfilerUID.cpp

MY_RUNTIME_SRC_FILES := \
	$(MY_SRC_DIR)/runtime/ArgList.cpp \
	$(MY_SRC_DIR)/runtime/ArrayBuffer.cpp \
	$(MY_SRC_DIR)/runtime/ArrayBufferNeuteringWatchpoint.cpp \
	$(MY_SRC_DIR)/runtime/ArrayBufferView.cpp \
	$(MY_SRC_DIR)/runtime/ArrayConstructor.cpp \
	$(MY_SRC_DIR)/runtime/ArrayConventions.cpp \
	$(MY_SRC_DIR)/runtime/ArrayIteratorPrototype.cpp \
	$(MY_SRC_DIR)/runtime/ArrayPrototype.cpp \
	$(MY_SRC_DIR)/runtime/BasicBlockLocation.cpp \
	$(MY_SRC_DIR)/runtime/BooleanConstructor.cpp \
	$(MY_SRC_DIR)/runtime/BooleanObject.cpp \
	$(MY_SRC_DIR)/runtime/BooleanPrototype.cpp \
	$(MY_SRC_DIR)/runtime/CallData.cpp \
	$(MY_SRC_DIR)/runtime/CatchScope.cpp \
	$(MY_SRC_DIR)/runtime/ClonedArguments.cpp \
	$(MY_SRC_DIR)/runtime/CodeCache.cpp \
	$(MY_SRC_DIR)/runtime/CodeSpecializationKind.cpp \
	$(MY_SRC_DIR)/runtime/CommonIdentifiers.cpp \
	$(MY_SRC_DIR)/runtime/CommonSlowPaths.cpp \
	$(MY_SRC_DIR)/runtime/CommonSlowPathsExceptions.cpp \
	$(MY_SRC_DIR)/runtime/CompilationResult.cpp \
	$(MY_SRC_DIR)/runtime/Completion.cpp \
	$(MY_SRC_DIR)/runtime/ConsoleClient.cpp \
	$(MY_SRC_DIR)/runtime/ConsoleObject.cpp \
	$(MY_SRC_DIR)/runtime/ConstantMode.cpp \
	$(MY_SRC_DIR)/runtime/ConstructData.cpp \
	$(MY_SRC_DIR)/runtime/ControlFlowProfiler.cpp \
	$(MY_SRC_DIR)/runtime/CustomGetterSetter.cpp \
	$(MY_SRC_DIR)/runtime/DataView.cpp \
	$(MY_SRC_DIR)/runtime/DateConstructor.cpp \
	$(MY_SRC_DIR)/runtime/DateConversion.cpp \
	$(MY_SRC_DIR)/runtime/DateInstance.cpp \
	$(MY_SRC_DIR)/runtime/DatePrototype.cpp \
	$(MY_SRC_DIR)/runtime/DirectArguments.cpp \
	$(MY_SRC_DIR)/runtime/DirectArgumentsOffset.cpp \
	$(MY_SRC_DIR)/runtime/DumpContext.cpp \
	$(MY_SRC_DIR)/runtime/ECMAScriptSpecInternalFunctions.cpp \
	$(MY_SRC_DIR)/runtime/Error.cpp \
	$(MY_SRC_DIR)/runtime/ErrorConstructor.cpp \
	$(MY_SRC_DIR)/runtime/ErrorHandlingScope.cpp \
	$(MY_SRC_DIR)/runtime/ErrorInstance.cpp \
	$(MY_SRC_DIR)/runtime/ErrorPrototype.cpp \
	$(MY_SRC_DIR)/runtime/Exception.cpp \
	$(MY_SRC_DIR)/runtime/ExceptionEventLocation.cpp \
	$(MY_SRC_DIR)/runtime/ExceptionFuzz.cpp \
	$(MY_SRC_DIR)/runtime/ExceptionHelpers.cpp \
	$(MY_SRC_DIR)/runtime/ExceptionScope.cpp \
	$(MY_SRC_DIR)/runtime/Executable.cpp \
	$(MY_SRC_DIR)/runtime/FunctionConstructor.cpp \
	$(MY_SRC_DIR)/runtime/FunctionExecutableDump.cpp \
	$(MY_SRC_DIR)/runtime/FunctionHasExecutedCache.cpp \
	$(MY_SRC_DIR)/runtime/FunctionPrototype.cpp \
	$(MY_SRC_DIR)/runtime/FunctionRareData.cpp \
	$(MY_SRC_DIR)/runtime/GeneratorFunctionConstructor.cpp \
	$(MY_SRC_DIR)/runtime/GeneratorFunctionPrototype.cpp \
	$(MY_SRC_DIR)/runtime/GeneratorPrototype.cpp \
	$(MY_SRC_DIR)/runtime/GetterSetter.cpp \
	$(MY_SRC_DIR)/runtime/HashMapImpl.cpp \
	$(MY_SRC_DIR)/runtime/Identifier.cpp \
	$(MY_SRC_DIR)/runtime/IndexingType.cpp \
	$(MY_SRC_DIR)/runtime/InferredType.cpp \
	$(MY_SRC_DIR)/runtime/InferredTypeTable.cpp \
	$(MY_SRC_DIR)/runtime/InferredValue.cpp \
	$(MY_SRC_DIR)/runtime/InitializeThreading.cpp \
	$(MY_SRC_DIR)/runtime/InspectorInstrumentationObject.cpp \
	$(MY_SRC_DIR)/runtime/InternalFunction.cpp \
	$(MY_SRC_DIR)/runtime/IntlCollator.cpp \
	$(MY_SRC_DIR)/runtime/IntlCollatorConstructor.cpp \
	$(MY_SRC_DIR)/runtime/IntlCollatorPrototype.cpp \
	$(MY_SRC_DIR)/runtime/IntlDateTimeFormat.cpp \
	$(MY_SRC_DIR)/runtime/IntlDateTimeFormatConstructor.cpp \
	$(MY_SRC_DIR)/runtime/IntlDateTimeFormatPrototype.cpp \
	$(MY_SRC_DIR)/runtime/IntlNumberFormat.cpp \
	$(MY_SRC_DIR)/runtime/IntlNumberFormatConstructor.cpp \
	$(MY_SRC_DIR)/runtime/IntlNumberFormatPrototype.cpp \
	$(MY_SRC_DIR)/runtime/IntlObject.cpp \
	$(MY_SRC_DIR)/runtime/IteratorOperations.cpp \
	$(MY_SRC_DIR)/runtime/IteratorPrototype.cpp \
	$(MY_SRC_DIR)/runtime/JSAPIValueWrapper.cpp \
	$(MY_SRC_DIR)/runtime/JSArray.cpp \
	$(MY_SRC_DIR)/runtime/JSArrayBuffer.cpp \
	$(MY_SRC_DIR)/runtime/JSArrayBufferConstructor.cpp \
	$(MY_SRC_DIR)/runtime/JSArrayBufferPrototype.cpp \
	$(MY_SRC_DIR)/runtime/JSArrayBufferView.cpp \
	$(MY_SRC_DIR)/runtime/JSBoundFunction.cpp \
	$(MY_SRC_DIR)/runtime/JSCJSValue.cpp \
	$(MY_SRC_DIR)/runtime/JSCallee.cpp \
	$(MY_SRC_DIR)/runtime/JSCell.cpp \
	$(MY_SRC_DIR)/runtime/JSCustomGetterSetterFunction.cpp \
	$(MY_SRC_DIR)/runtime/JSDataView.cpp \
	$(MY_SRC_DIR)/runtime/JSDataViewPrototype.cpp \
	$(MY_SRC_DIR)/runtime/JSDateMath.cpp \
	$(MY_SRC_DIR)/runtime/JSEnvironmentRecord.cpp \
	$(MY_SRC_DIR)/runtime/JSFunction.cpp \
	$(MY_SRC_DIR)/runtime/JSGeneratorFunction.cpp \
	$(MY_SRC_DIR)/runtime/JSGlobalLexicalEnvironment.cpp \
	$(MY_SRC_DIR)/runtime/JSGlobalObject.cpp \
	$(MY_SRC_DIR)/runtime/JSGlobalObjectDebuggable.cpp \
	$(MY_SRC_DIR)/runtime/JSGlobalObjectFunctions.cpp \
	$(MY_SRC_DIR)/runtime/JSInternalPromise.cpp \
	$(MY_SRC_DIR)/runtime/JSInternalPromiseConstructor.cpp \
	$(MY_SRC_DIR)/runtime/JSInternalPromiseDeferred.cpp \
	$(MY_SRC_DIR)/runtime/JSInternalPromisePrototype.cpp \
	$(MY_SRC_DIR)/runtime/JSJob.cpp \
	$(MY_SRC_DIR)/runtime/JSLexicalEnvironment.cpp \
	$(MY_SRC_DIR)/runtime/JSLock.cpp \
	$(MY_SRC_DIR)/runtime/JSMap.cpp \
	$(MY_SRC_DIR)/runtime/JSMapIterator.cpp \
	$(MY_SRC_DIR)/runtime/JSModuleEnvironment.cpp \
	$(MY_SRC_DIR)/runtime/JSModuleLoader.cpp \
	$(MY_SRC_DIR)/runtime/JSModuleNamespaceObject.cpp \
	$(MY_SRC_DIR)/runtime/JSModuleRecord.cpp \
	$(MY_SRC_DIR)/runtime/JSNativeStdFunction.cpp \
	$(MY_SRC_DIR)/runtime/JSONObject.cpp \
	$(MY_SRC_DIR)/runtime/JSObject.cpp \
	$(MY_SRC_DIR)/runtime/JSPromise.cpp \
	$(MY_SRC_DIR)/runtime/JSPromiseConstructor.cpp \
	$(MY_SRC_DIR)/runtime/JSPromiseDeferred.cpp \
	$(MY_SRC_DIR)/runtime/JSPromisePrototype.cpp \
	$(MY_SRC_DIR)/runtime/JSPropertyNameEnumerator.cpp \
	$(MY_SRC_DIR)/runtime/JSPropertyNameIterator.cpp \
	$(MY_SRC_DIR)/runtime/JSProxy.cpp \
	$(MY_SRC_DIR)/runtime/JSScope.cpp \
	$(MY_SRC_DIR)/runtime/JSSegmentedVariableObject.cpp \
	$(MY_SRC_DIR)/runtime/JSSet.cpp \
	$(MY_SRC_DIR)/runtime/JSSetIterator.cpp \
	$(MY_SRC_DIR)/runtime/JSString.cpp \
	$(MY_SRC_DIR)/runtime/JSStringIterator.cpp \
	$(MY_SRC_DIR)/runtime/JSStringJoiner.cpp \
	$(MY_SRC_DIR)/runtime/JSSymbolTableObject.cpp \
	$(MY_SRC_DIR)/runtime/JSTemplateRegistryKey.cpp \
	$(MY_SRC_DIR)/runtime/JSTypedArrayConstructors.cpp \
	$(MY_SRC_DIR)/runtime/JSTypedArrayPrototypes.cpp \
	$(MY_SRC_DIR)/runtime/JSTypedArrayViewConstructor.cpp \
	$(MY_SRC_DIR)/runtime/JSTypedArrayViewPrototype.cpp \
	$(MY_SRC_DIR)/runtime/JSTypedArrays.cpp \
	$(MY_SRC_DIR)/runtime/JSWeakMap.cpp \
	$(MY_SRC_DIR)/runtime/JSWeakSet.cpp \
	$(MY_SRC_DIR)/runtime/JSWithScope.cpp \
	$(MY_SRC_DIR)/runtime/JSWrapperObject.cpp \
	$(MY_SRC_DIR)/runtime/LazyClassStructure.cpp \
	$(MY_SRC_DIR)/runtime/LiteralParser.cpp \
	$(MY_SRC_DIR)/runtime/Lookup.cpp \
	$(MY_SRC_DIR)/runtime/MapBase.cpp \
	$(MY_SRC_DIR)/runtime/MapConstructor.cpp \
	$(MY_SRC_DIR)/runtime/MapIteratorPrototype.cpp \
	$(MY_SRC_DIR)/runtime/MapPrototype.cpp \
	$(MY_SRC_DIR)/runtime/MatchResult.cpp \
	$(MY_SRC_DIR)/runtime/MathCommon.cpp \
	$(MY_SRC_DIR)/runtime/MathObject.cpp \
	$(MY_SRC_DIR)/runtime/MemoryStatistics.cpp \
	$(MY_SRC_DIR)/runtime/ModuleLoaderPrototype.cpp \
	$(MY_SRC_DIR)/runtime/NativeErrorConstructor.cpp \
	$(MY_SRC_DIR)/runtime/NativeErrorPrototype.cpp \
	$(MY_SRC_DIR)/runtime/NativeStdFunctionCell.cpp \
	$(MY_SRC_DIR)/runtime/NullGetterFunction.cpp \
	$(MY_SRC_DIR)/runtime/NullSetterFunction.cpp \
	$(MY_SRC_DIR)/runtime/NumberConstructor.cpp \
	$(MY_SRC_DIR)/runtime/NumberObject.cpp \
	$(MY_SRC_DIR)/runtime/NumberPrototype.cpp \
	$(MY_SRC_DIR)/runtime/ObjectConstructor.cpp \
	$(MY_SRC_DIR)/runtime/ObjectPrototype.cpp \
	$(MY_SRC_DIR)/runtime/Operations.cpp \
	$(MY_SRC_DIR)/runtime/Options.cpp \
	$(MY_SRC_DIR)/runtime/PropertyDescriptor.cpp \
	$(MY_SRC_DIR)/runtime/PropertySlot.cpp \
	$(MY_SRC_DIR)/runtime/PropertyTable.cpp \
	$(MY_SRC_DIR)/runtime/PrototypeMap.cpp \
	$(MY_SRC_DIR)/runtime/ProxyConstructor.cpp \
	$(MY_SRC_DIR)/runtime/ProxyObject.cpp \
	$(MY_SRC_DIR)/runtime/ProxyRevoke.cpp \
	$(MY_SRC_DIR)/runtime/ReflectObject.cpp \
	$(MY_SRC_DIR)/runtime/RegExp.cpp \
	$(MY_SRC_DIR)/runtime/RegExpCache.cpp \
	$(MY_SRC_DIR)/runtime/RegExpCachedResult.cpp \
	$(MY_SRC_DIR)/runtime/RegExpConstructor.cpp \
	$(MY_SRC_DIR)/runtime/RegExpMatchesArray.cpp \
	$(MY_SRC_DIR)/runtime/RegExpObject.cpp \
	$(MY_SRC_DIR)/runtime/RegExpPrototype.cpp \
	$(MY_SRC_DIR)/runtime/RuntimeType.cpp \
	$(MY_SRC_DIR)/runtime/SamplingCounter.cpp \
	$(MY_SRC_DIR)/runtime/SamplingProfiler.cpp \
	$(MY_SRC_DIR)/runtime/ScopeOffset.cpp \
	$(MY_SRC_DIR)/runtime/ScopedArguments.cpp \
	$(MY_SRC_DIR)/runtime/ScopedArgumentsTable.cpp \
	$(MY_SRC_DIR)/runtime/SetConstructor.cpp \
	$(MY_SRC_DIR)/runtime/SetIteratorPrototype.cpp \
	$(MY_SRC_DIR)/runtime/SetPrototype.cpp \
	$(MY_SRC_DIR)/runtime/SimpleTypedArrayController.cpp \
	$(MY_SRC_DIR)/runtime/SmallStrings.cpp \
	$(MY_SRC_DIR)/runtime/SparseArrayValueMap.cpp \
	$(MY_SRC_DIR)/runtime/StackFrame.cpp \
	$(MY_SRC_DIR)/runtime/StrictEvalActivation.cpp \
	$(MY_SRC_DIR)/runtime/StringConstructor.cpp \
	$(MY_SRC_DIR)/runtime/StringIteratorPrototype.cpp \
	$(MY_SRC_DIR)/runtime/StringObject.cpp \
	$(MY_SRC_DIR)/runtime/StringPrototype.cpp \
	$(MY_SRC_DIR)/runtime/StringRecursionChecker.cpp \
	$(MY_SRC_DIR)/runtime/Structure.cpp \
	$(MY_SRC_DIR)/runtime/StructureChain.cpp \
	$(MY_SRC_DIR)/runtime/StructureIDTable.cpp \
	$(MY_SRC_DIR)/runtime/StructureRareData.cpp \
	$(MY_SRC_DIR)/runtime/Symbol.cpp \
	$(MY_SRC_DIR)/runtime/SymbolConstructor.cpp \
	$(MY_SRC_DIR)/runtime/SymbolObject.cpp \
	$(MY_SRC_DIR)/runtime/SymbolPrototype.cpp \
	$(MY_SRC_DIR)/runtime/SymbolTable.cpp \
	$(MY_SRC_DIR)/runtime/ThrowScope.cpp \
	$(MY_SRC_DIR)/runtime/TemplateRegistry.cpp \
	$(MY_SRC_DIR)/runtime/TestRunnerUtils.cpp \
	$(MY_SRC_DIR)/runtime/TypeLocationCache.cpp \
	$(MY_SRC_DIR)/runtime/TypeProfiler.cpp \
	$(MY_SRC_DIR)/runtime/TypeProfilerLog.cpp \
	$(MY_SRC_DIR)/runtime/TypeSet.cpp \
	$(MY_SRC_DIR)/runtime/TypedArrayController.cpp \
	$(MY_SRC_DIR)/runtime/TypedArrayType.cpp \
	$(MY_SRC_DIR)/runtime/TypeofType.cpp \
	$(MY_SRC_DIR)/runtime/VM.cpp \
	$(MY_SRC_DIR)/runtime/VMEntryScope.cpp \
	$(MY_SRC_DIR)/runtime/VarOffset.cpp \
	$(MY_SRC_DIR)/runtime/Watchdog.cpp \
	$(MY_SRC_DIR)/runtime/WeakMapConstructor.cpp \
	$(MY_SRC_DIR)/runtime/WeakMapData.cpp \
	$(MY_SRC_DIR)/runtime/WeakMapPrototype.cpp \
	$(MY_SRC_DIR)/runtime/WeakSetConstructor.cpp \
	$(MY_SRC_DIR)/runtime/WeakSetPrototype.cpp

MY_TOOLS_SRC_FILES := \
	$(MY_SRC_DIR)/tools/CodeProfile.cpp \
	$(MY_SRC_DIR)/tools/CodeProfiling.cpp \
	$(MY_SRC_DIR)/tools/FunctionOverrides.cpp \
	$(MY_SRC_DIR)/tools/FunctionWhitelist.cpp \
	$(MY_SRC_DIR)/tools/JSDollarVM.cpp \
	$(MY_SRC_DIR)/tools/JSDollarVMPrototype.cpp

MY_WASM_SRC_FILES := \
	$(MY_SRC_DIR)/wasm/JSWASMModule.cpp \
	$(MY_SRC_DIR)/wasm/WASMB3IRGenerator.cpp \
	$(MY_SRC_DIR)/wasm/WASMCallingConvention.cpp \
	$(MY_SRC_DIR)/wasm/WASMModuleParser.cpp \
	$(MY_SRC_DIR)/wasm/WASMPlan.cpp \
	$(MY_SRC_DIR)/wasm/WASMSections.cpp

MY_YARR_SRC_FILES := \
	$(MY_SRC_DIR)/yarr/RegularExpression.cpp \
	$(MY_SRC_DIR)/yarr/YarrCanonicalizeUCS2.cpp \
	$(MY_SRC_DIR)/yarr/YarrInterpreter.cpp \
	$(MY_SRC_DIR)/yarr/YarrJIT.cpp \
	$(MY_SRC_DIR)/yarr/YarrPattern.cpp \
	$(MY_SRC_DIR)/yarr/YarrSyntaxChecker.cpp


LOCAL_SRC_FILES := \
	$(MY_API_SRC_FILES) \
	$(MY_ASSEMBLER_SRC_FILES) \
	$(MY_B3_SRC_FILES) \
	$(MY_BINDING_SRC_FILES) \
	$(MY_BUILTINS_SRC_FILES) \
	$(MY_BYTECODE_SRC_FILES) \
	$(MY_BYTECOMPILER_SRC_FILES) \
	$(MY_DEBUGGER_SRC_FILES) \
	$(MY_DFG_SRC_FILES) \
	$(MY_DISASSEMBLER_SRC_FILES) \
	$(MY_FTL_SRC_FILES) \
	$(MY_HEAP_SRC_FILES) \
	$(MY_INSPECTOR_SRC_FILES) \
	$(MY_INTERPRETER_SRC_FILES) \
	$(MY_JIT_SRC_FILES) \
	$(MY_LLINT_SRC_FILES) \
	$(MY_PARSER_SRC_FILES) \
	$(MY_PROFILER_SRC_FILES) \
	$(MY_RUNTIME_SRC_FILES) \
	$(MY_TOOLS_SRC_FILES) \
    $(MY_WASM_SRC_FILES) \
    $(MY_YARR_SRC_FILES) \
    $(MY_GENERATED_SRC_FILES)


include $(BUILD_STATIC_LIBRARY)

