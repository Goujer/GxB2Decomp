using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

namespace LuaInterface
{
	public class LuaFunction : LuaBaseRef
	{
		[StructLayout(LayoutKind.Sequential, Size = 8)]
		protected struct FuncData
		{
			public int oldTop;

			public int stackPos;

			public FuncData(int top, int stack)
			{
				oldTop = 0;
				stackPos = 0;
			}
		}

		protected int oldTop;

		private int argCount;

		private int stackPos;

		private Stack<FuncData> stack;

		public LuaFunction(int reference, LuaState state)
		{
		}

		public override void Dispose()
		{
		}

		public T ToDelegate<T>() where T : class
		{
			return null;
		}

		public virtual int BeginPCall()
		{
			return 0;
		}

		public void PCall()
		{
		}

		public void EndPCall()
		{
		}

		public void Call()
		{
		}

		public void Call<T1>(T1 arg1)
		{
		}

		public void Call<T1, T2>(T1 arg1, T2 arg2)
		{
		}

		public void Call<T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3)
		{
		}

		public void Call<T1, T2, T3, T4>(T1 arg1, T2 arg2, T3 arg3, T4 arg4)
		{
		}

		public void Call<T1, T2, T3, T4, T5>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
		{
		}

		public void Call<T1, T2, T3, T4, T5, T6>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
		{
		}

		public void Call<T1, T2, T3, T4, T5, T6, T7>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7)
		{
		}

		public void Call<T1, T2, T3, T4, T5, T6, T7, T8>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8)
		{
		}

		public void Call<T1, T2, T3, T4, T5, T6, T7, T8, T9>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, T9 arg9)
		{
		}

		public R1 Invoke<R1>()
		{
			return default(R1);
		}

		public R1 Invoke<T1, R1>(T1 arg1)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, R1>(T1 arg1, T2 arg2)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, R1>(T1 arg1, T2 arg2, T3 arg3)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, R1>(T1 arg1, T2 arg2, T3 arg3, T4 arg4)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, T5, R1>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, T5, T6, R1>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, T5, T6, T7, R1>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, T5, T6, T7, T8, R1>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8)
		{
			return default(R1);
		}

		public R1 Invoke<T1, T2, T3, T4, T5, T6, T7, T8, T9, R1>(T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6, T7 arg7, T8 arg8, T9 arg9)
		{
			return default(R1);
		}

		[Obsolete]
		public object[] LazyCall(params object[] args)
		{
			return null;
		}

		public void CheckStack(int args)
		{
		}

		public bool IsBegin()
		{
			return false;
		}

		public void Push(double num)
		{
		}

		public void Push(int n)
		{
		}

		public void PushLayerMask(LayerMask n)
		{
		}

		public void Push(uint un)
		{
		}

		public void Push(long num)
		{
		}

		public void Push(ulong un)
		{
		}

		public void Push(bool b)
		{
		}

		public void Push(string str)
		{
		}

		public void Push(IntPtr ptr)
		{
		}

		public void Push(LuaBaseRef lbr)
		{
		}

		public void Push(object o)
		{
		}

		public void Push(UnityEngine.Object o)
		{
		}

		public void Push(Type t)
		{
		}

		public void Push(Enum e)
		{
		}

		public void Push(Array array)
		{
		}

		public void Push(Vector3 v3)
		{
		}

		public void Push(Vector2 v2)
		{
		}

		public void Push(Vector4 v4)
		{
		}

		public void Push(Quaternion quat)
		{
		}

		public void Push(Color clr)
		{
		}

		public void Push(Ray ray)
		{
		}

		public void Push(Bounds bounds)
		{
		}

		public void Push(RaycastHit hit)
		{
		}

		public void Push(Touch t)
		{
		}

		public void Push(LuaByteBuffer buffer)
		{
		}

		public void PushValue<T>(T value) where T : struct
		{
		}

		public void PushObject(object o)
		{
		}

		public void PushSealed<T>(T o)
		{
		}

		public void PushGeneric<T>(T t)
		{
		}

		public void PushArgs(object[] args)
		{
		}

		public void PushByteBuffer(byte[] buffer, int len = -1)
		{
		}

		public double CheckNumber()
		{
			return 0.0;
		}

		public bool CheckBoolean()
		{
			return false;
		}

		public string CheckString()
		{
			return null;
		}

		public Vector3 CheckVector3()
		{
			return default(Vector3);
		}

		public Quaternion CheckQuaternion()
		{
			return default(Quaternion);
		}

		public Vector2 CheckVector2()
		{
			return default(Vector2);
		}

		public Vector4 CheckVector4()
		{
			return default(Vector4);
		}

		public Color CheckColor()
		{
			return default(Color);
		}

		public Ray CheckRay()
		{
			return default(Ray);
		}

		public Bounds CheckBounds()
		{
			return default(Bounds);
		}

		public LayerMask CheckLayerMask()
		{
			return default(LayerMask);
		}

		public long CheckLong()
		{
			return 0L;
		}

		public ulong CheckULong()
		{
			return 0uL;
		}

		public Delegate CheckDelegate()
		{
			return null;
		}

		public object CheckVariant()
		{
			return null;
		}

		public char[] CheckCharBuffer()
		{
			return null;
		}

		public byte[] CheckByteBuffer()
		{
			return null;
		}

		public object CheckObject(Type t)
		{
			return null;
		}

		public LuaFunction CheckLuaFunction()
		{
			return null;
		}

		public LuaTable CheckLuaTable()
		{
			return null;
		}

		public LuaThread CheckLuaThread()
		{
			return null;
		}

		public T CheckValue<T>()
		{
			return default(T);
		}
	}
}
