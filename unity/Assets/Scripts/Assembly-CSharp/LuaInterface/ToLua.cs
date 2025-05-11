using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

namespace LuaInterface
{
	public static class ToLua
	{
		[StructLayout(LayoutKind.Auto, Size = 8)]
		public delegate object LuaTableToVar(IntPtr L, int pos);

		[StructLayout(LayoutKind.Auto, Size = 8)]
		public delegate void LuaPushVarObject(IntPtr L, object o);

		private static Type monoType;

		public static LuaTableToVar[] ToVarMap;

		public static Dictionary<Type, LuaPushVarObject> VarPushMap;

		static ToLua()
		{
		}

		public static void OpenLibs(IntPtr L)
		{
		}

		private static void AddLuaLoader(IntPtr L)
		{
		}

		private static int Panic(IntPtr L)
		{
			return 0;
		}

		private static int Print(IntPtr L)
		{
			return 0;
		}

		private static int Loader(IntPtr L)
		{
			return 0;
		}

		public static int DoFile(IntPtr L)
		{
			return 0;
		}

		public static int LoadFile(IntPtr L)
		{
			return 0;
		}

		private static int IsNull(IntPtr L)
		{
			return 0;
		}

		private static int BufferToString(IntPtr L)
		{
			return 0;
		}

		private static int GetClassType(IntPtr L)
		{
			return 0;
		}

		private static int TableToArray(IntPtr L)
		{
			return 0;
		}

		public static int op_ToString(IntPtr L)
		{
			return 0;
		}

		public static string ToString(IntPtr L, int stackPos)
		{
			return null;
		}

		public static object ToObject(IntPtr L, int stackPos)
		{
			return null;
		}

		public static LuaFunction ToLuaFunction(IntPtr L, int stackPos)
		{
			return null;
		}

		public static LuaTable ToLuaTable(IntPtr L, int stackPos)
		{
			return null;
		}

		public static LuaThread ToLuaThread(IntPtr L, int stackPos)
		{
			return null;
		}

		public static Vector3 ToVector3(IntPtr L, int stackPos)
		{
			return default(Vector3);
		}

		public static Vector4 ToVector4(IntPtr L, int stackPos)
		{
			return default(Vector4);
		}

		public static Vector2 ToVector2(IntPtr L, int stackPos)
		{
			return default(Vector2);
		}

		public static Quaternion ToQuaternion(IntPtr L, int stackPos)
		{
			return default(Quaternion);
		}

		public static Color ToColor(IntPtr L, int stackPos)
		{
			return default(Color);
		}

		public static Ray ToRay(IntPtr L, int stackPos)
		{
			return default(Ray);
		}

		public static Bounds ToBounds(IntPtr L, int stackPos)
		{
			return default(Bounds);
		}

		public static LayerMask ToLayerMask(IntPtr L, int stackPos)
		{
			return default(LayerMask);
		}

		public static object ToVarObject(IntPtr L, int stackPos)
		{
			return null;
		}

		public static object ToVarObject(IntPtr L, int stackPos, Type t)
		{
			return null;
		}

		public static object ToVarTable(IntPtr L, int stackPos)
		{
			return null;
		}

		public static T? ToNullable<T>(IntPtr L, int stackPos) where T : struct
		{
			return null;
		}

		private static object ToObjectVec3(IntPtr L, int stackPos)
		{
			return null;
		}

		private static object ToObjectQuat(IntPtr L, int stackPos)
		{
			return null;
		}

		private static object ToObjectColor(IntPtr L, int stackPos)
		{
			return null;
		}

		private static object ToObjectVec4(IntPtr L, int stackPos)
		{
			return null;
		}

		private static object ToObjectVec2(IntPtr L, int stackPos)
		{
			return null;
		}

		private static object ToObjectRay(IntPtr L, int stackPos)
		{
			return null;
		}

		private static object ToObjectLayerMask(IntPtr L, int stackPos)
		{
			return null;
		}

		private static object ToObjectBounds(IntPtr L, int stackPos)
		{
			return null;
		}

		public static LuaFunction CheckLuaFunction(IntPtr L, int stackPos)
		{
			return null;
		}

		public static LuaTable CheckLuaTable(IntPtr L, int stackPos)
		{
			return null;
		}

		public static LuaThread CheckLuaThread(IntPtr L, int stackPos)
		{
			return null;
		}

		public static LuaBaseRef CheckLuaBaseRef(IntPtr L, int stackPos)
		{
			return null;
		}

		public static string CheckString(IntPtr L, int stackPos)
		{
			return null;
		}

		public static IntPtr CheckIntPtr(IntPtr L, int stackPos)
		{
			return (IntPtr)0;
		}

		public static Type CheckMonoType(IntPtr L, int stackPos)
		{
			return null;
		}

		public static IEnumerator CheckIter(IntPtr L, int stackPos)
		{
			return null;
		}

		public static object CheckObject(IntPtr L, int stackPos)
		{
			return null;
		}

		public static object CheckObject(IntPtr L, int stackPos, Type type)
		{
			return null;
		}

		public static object CheckObject<T>(IntPtr L, int stackPos) where T : class
		{
			return null;
		}

		public static Vector3 CheckVector3(IntPtr L, int stackPos)
		{
			return default(Vector3);
		}

		public static Quaternion CheckQuaternion(IntPtr L, int stackPos)
		{
			return default(Quaternion);
		}

		public static Vector2 CheckVector2(IntPtr L, int stackPos)
		{
			return default(Vector2);
		}

		public static Vector4 CheckVector4(IntPtr L, int stackPos)
		{
			return default(Vector4);
		}

		public static Color CheckColor(IntPtr L, int stackPos)
		{
			return default(Color);
		}

		public static Ray CheckRay(IntPtr L, int stackPos)
		{
			return default(Ray);
		}

		public static Bounds CheckBounds(IntPtr L, int stackPos)
		{
			return default(Bounds);
		}

		public static LayerMask CheckLayerMask(IntPtr L, int stackPos)
		{
			return default(LayerMask);
		}

		public static T CheckValue<T>(IntPtr L, int stackPos) where T : struct
		{
			return default(T);
		}

		public static T? CheckNullable<T>(IntPtr L, int stackPos) where T : struct
		{
			return null;
		}

		public static object CheckVarObject(IntPtr L, int stackPos, Type t)
		{
			return null;
		}

		public static UnityEngine.Object CheckUnityObject(IntPtr L, int stackPos, Type type)
		{
			return null;
		}

		public static TrackedReference CheckTrackedReference(IntPtr L, int stackPos, Type type)
		{
			return null;
		}

		public static object[] CheckObjectArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public static T[] CheckObjectArray<T>(IntPtr L, int stackPos) where T : class
		{
			return null;
		}

		public static T[] CheckStructArray<T>(IntPtr L, int stackPos) where T : struct
		{
			return null;
		}

		public static char[] CheckCharBuffer(IntPtr L, int stackPos)
		{
			return null;
		}

		public static byte[] CheckByteBuffer(IntPtr L, int stackPos)
		{
			return null;
		}

		public static T[] CheckNumberArray<T>(IntPtr L, int stackPos) where T : struct
		{
			return null;
		}

		public static bool[] CheckBoolArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public static string[] CheckStringArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public static object CheckGenericObject(IntPtr L, int stackPos, Type type, out Type ArgType)
		{
			ArgType = null;
			return null;
		}

		public static object CheckGenericObject(IntPtr L, int stackPos, Type type, out Type t1, out Type t2)
		{
			t1 = null;
			t2 = null;
			return null;
		}

		public static object CheckGenericObject(IntPtr L, int stackPos, Type type)
		{
			return null;
		}

		public static object[] ToParamsObject(IntPtr L, int stackPos, int count)
		{
			return null;
		}

		public static T[] ToParamsObject<T>(IntPtr L, int stackPos, int count)
		{
			return null;
		}

		public static string[] ToParamsString(IntPtr L, int stackPos, int count)
		{
			return null;
		}

		public static T[] ToParamsNumber<T>(IntPtr L, int stackPos, int count) where T : struct
		{
			return null;
		}

		public static char[] ToParamsChar(IntPtr L, int stackPos, int count)
		{
			return null;
		}

		public static bool[] CheckParamsBool(IntPtr L, int stackPos, int count)
		{
			return null;
		}

		public static T[] CheckParamsNumber<T>(IntPtr L, int stackPos, int count) where T : struct
		{
			return null;
		}

		public static char[] CheckParamsChar(IntPtr L, int stackPos, int count)
		{
			return null;
		}

		public static string[] CheckParamsString(IntPtr L, int stackPos, int count)
		{
			return null;
		}

		public static T[] CheckParamsObject<T>(IntPtr L, int stackPos, int count)
		{
			return null;
		}

		public static char[] ToCharBuffer(IntPtr L, int stackPos)
		{
			return null;
		}

		public static byte[] ToByteBuffer(IntPtr L, int stackPos)
		{
			return null;
		}

		public static T[] ToNumberArray<T>(IntPtr L, int stackPos) where T : struct
		{
			return null;
		}

		public static bool[] ToBoolArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public static string[] ToStringArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public static object[] ToObjectArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public static T[] ToObjectArray<T>(IntPtr L, int stackPos) where T : class
		{
			return null;
		}

		public static T[] ToStructArray<T>(IntPtr L, int stackPos) where T : struct
		{
			return null;
		}

		public static void Push(IntPtr L, Vector3 v3)
		{
		}

		public static void Push(IntPtr L, Vector2 v2)
		{
		}

		public static void Push(IntPtr L, Vector4 v4)
		{
		}

		public static void Push(IntPtr L, Quaternion q)
		{
		}

		public static void Push(IntPtr L, Color clr)
		{
		}

		public static void Push(IntPtr L, Ray ray)
		{
		}

		public static void Push(IntPtr L, Bounds bound)
		{
		}

		public static void Push(IntPtr L, RaycastHit hit)
		{
		}

		public static void Push(IntPtr L, RaycastHit hit, int flag)
		{
		}

		public static void Push(IntPtr L, Touch t)
		{
		}

		public static void Push(IntPtr L, Touch t, int flag)
		{
		}

		public static void PushLayerMask(IntPtr L, LayerMask l)
		{
		}

		public static void Push(IntPtr L, LuaByteBuffer bb)
		{
		}

		public static void PushByteBuffer(IntPtr L, byte[] buffer)
		{
		}

		public static void Push(IntPtr L, Array array)
		{
		}

		public static void Push(IntPtr L, LuaBaseRef lbr)
		{
		}

		public static void Push(IntPtr L, Type t)
		{
		}

		public static void Push(IntPtr L, Delegate ev)
		{
		}

		public static void Push(IntPtr L, EventObject ev)
		{
		}

		public static void Push(IntPtr L, IEnumerator iter)
		{
		}

		public static void Push(IntPtr L, Enum e)
		{
		}

		public static void PushOut<T>(IntPtr L, LuaOut<T> lo)
		{
		}

		public static void PushStruct(IntPtr L, object o)
		{
		}

		public static void PushValue<T>(IntPtr L, T v) where T : struct
		{
		}

		public static void PusNullable<T>(IntPtr L, T? v) where T : struct
		{
		}

		public static void PushUserData(IntPtr L, object o, int reference)
		{
		}

		private static int LuaPCall(IntPtr L, LuaCSFunction func)
		{
			return 0;
		}

		public static int LoadPreType(IntPtr L, Type type)
		{
			return 0;
		}

		private static void PushUserObject(IntPtr L, object o)
		{
		}

		public static void Push(IntPtr L, UnityEngine.Object obj)
		{
		}

		public static void Push(IntPtr L, TrackedReference obj)
		{
		}

		public static void PushSealed<T>(IntPtr L, T o)
		{
		}

		public static void PushObject(IntPtr L, object o)
		{
		}

		public static void Push(IntPtr L, nil obj)
		{
		}

		public static void Push(IntPtr L, object obj)
		{
		}

		public static void SetBack(IntPtr L, int stackPos, object o)
		{
		}

		public static int Destroy(IntPtr L)
		{
			return 0;
		}

		public static void CheckArgsCount(IntPtr L, string method, int count)
		{
		}

		public static void CheckArgsCount(IntPtr L, int count)
		{
		}

		public static Delegate CheckDelegate(Type t, IntPtr L, int stackPos)
		{
			return null;
		}

		public static Delegate CheckDelegate<T>(IntPtr L, int stackPos)
		{
			return null;
		}
	}
}
