using System;
using System.Collections;
using UnityEngine;

namespace LuaInterface
{
	public class LuaStackOp
	{
		public sbyte ToSByte(IntPtr L, int stackPos)
		{
			return 0;
		}

		public byte ToByte(IntPtr L, int stackPos)
		{
			return 0;
		}

		public short ToInt16(IntPtr L, int stackPos)
		{
			return 0;
		}

		public ushort ToUInt16(IntPtr L, int stackPos)
		{
			return 0;
		}

		public char ToChar(IntPtr L, int stackPos)
		{
			return '\0';
		}

		public int ToInt32(IntPtr L, int stackPos)
		{
			return 0;
		}

		public uint ToUInt32(IntPtr L, int stackPos)
		{
			return 0u;
		}

		public decimal ToDecimal(IntPtr L, int stackPos)
		{
			return default(decimal);
		}

		public float ToFloat(IntPtr L, int stackPos)
		{
			return 0f;
		}

		public LuaByteBuffer ToLuaByteBuffer(IntPtr L, int stackPos)
		{
			return default(LuaByteBuffer);
		}

		public IEnumerator ToIter(IntPtr L, int stackPos)
		{
			return null;
		}

		public Type ToType(IntPtr L, int stackPos)
		{
			return null;
		}

		public EventObject ToEventObject(IntPtr L, int stackPos)
		{
			return null;
		}

		public Transform ToTransform(IntPtr L, int stackPos)
		{
			return null;
		}

		public GameObject ToGameObject(IntPtr L, int stackPos)
		{
			return null;
		}

		public object ToObject(IntPtr L, int stackPos)
		{
			return null;
		}

		public sbyte CheckSByte(IntPtr L, int stackPos)
		{
			return 0;
		}

		public byte CheckByte(IntPtr L, int stackPos)
		{
			return 0;
		}

		public short CheckInt16(IntPtr L, int stackPos)
		{
			return 0;
		}

		public ushort CheckUInt16(IntPtr L, int stackPos)
		{
			return 0;
		}

		public char CheckChar(IntPtr L, int stackPos)
		{
			return '\0';
		}

		public int CheckInt32(IntPtr L, int stackPos)
		{
			return 0;
		}

		public uint CheckUInt32(IntPtr L, int stackPos)
		{
			return 0u;
		}

		public decimal CheckDecimal(IntPtr L, int stackPos)
		{
			return default(decimal);
		}

		public float CheckFloat(IntPtr L, int stackPos)
		{
			return 0f;
		}

		public IntPtr CheckIntPtr(IntPtr L, int stackPos)
		{
			return (IntPtr)0;
		}

		public UIntPtr CheckUIntPtr(IntPtr L, int stackPos)
		{
			return (UIntPtr)0u;
		}

		public LuaByteBuffer CheckLuaByteBuffer(IntPtr L, int stackPos)
		{
			return default(LuaByteBuffer);
		}

		public EventObject CheckEventObject(IntPtr L, int stackPos)
		{
			return null;
		}

		public Transform CheckTransform(IntPtr L, int stackPos)
		{
			return null;
		}

		public GameObject CheckGameObject(IntPtr L, int stackPos)
		{
			return null;
		}

		public void Push(IntPtr L, sbyte n)
		{
		}

		public void Push(IntPtr L, byte n)
		{
		}

		public void Push(IntPtr L, short n)
		{
		}

		public void Push(IntPtr L, ushort n)
		{
		}

		public void Push(IntPtr L, char n)
		{
		}

		public void Push(IntPtr L, int n)
		{
		}

		public void Push(IntPtr L, uint n)
		{
		}

		public void Push(IntPtr L, decimal n)
		{
		}

		public void Push(IntPtr L, float n)
		{
		}

		public void Push(IntPtr L, UIntPtr p)
		{
		}

		public void Push(IntPtr L, Delegate ev)
		{
		}

		public void Push(IntPtr L, object obj)
		{
		}

		public void Push(IntPtr L, GameObject o)
		{
		}

		public void Push(IntPtr L, Transform o)
		{
		}

		public sbyte? ToNullSByte(IntPtr L, int stackPos)
		{
			return null;
		}

		public byte? ToNullByte(IntPtr L, int stackPos)
		{
			return null;
		}

		public short? ToNullInt16(IntPtr L, int stackPos)
		{
			return null;
		}

		public ushort? ToNullUInt16(IntPtr L, int stackPos)
		{
			return null;
		}

		public char? ToNullChar(IntPtr L, int stackPos)
		{
			return null;
		}

		public int? ToNullInt32(IntPtr L, int stackPos)
		{
			return null;
		}

		public uint? ToNullUInt32(IntPtr L, int stackPos)
		{
			return null;
		}

		public decimal? ToNullDecimal(IntPtr L, int stackPos)
		{
			return null;
		}

		public float? ToNullFloat(IntPtr L, int stackPos)
		{
			return null;
		}

		public double? ToNullNumber(IntPtr L, int stackPos)
		{
			return null;
		}

		public bool? ToNullBool(IntPtr L, int stackPos)
		{
			return null;
		}

		public long? ToNullInt64(IntPtr L, int stackPos)
		{
			return null;
		}

		public ulong? ToNullUInt64(IntPtr L, int stackPos)
		{
			return null;
		}

		public sbyte[] ToSByteArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public short[] ToInt16Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public ushort[] ToUInt16Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public decimal[] ToDecimalArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public float[] ToFloatArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public double[] ToDoubleArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public int[] ToInt32Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public uint[] ToUInt32Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public long[] ToInt64Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public ulong[] ToUInt64Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector3? ToNullVec3(IntPtr L, int stackPos)
		{
			return null;
		}

		public Quaternion? ToNullQuat(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector2? ToNullVec2(IntPtr L, int stackPos)
		{
			return null;
		}

		public Color? ToNullColor(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector4? ToNullVec4(IntPtr L, int stackPos)
		{
			return null;
		}

		public Ray? ToNullRay(IntPtr L, int stackPos)
		{
			return null;
		}

		public Bounds? ToNullBounds(IntPtr L, int stackPos)
		{
			return null;
		}

		public LayerMask? ToNullLayerMask(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector3[] ToVec3Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public Quaternion[] ToQuatArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector2[] ToVec2Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public Color[] ToColorArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector4[] ToVec4Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public Type[] ToTypeArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public sbyte? CheckNullSByte(IntPtr L, int stackPos)
		{
			return null;
		}

		public byte? CheckNullByte(IntPtr L, int stackPos)
		{
			return null;
		}

		public short? CheckNullInt16(IntPtr L, int stackPos)
		{
			return null;
		}

		public ushort? CheckNullUInt16(IntPtr L, int stackPos)
		{
			return null;
		}

		public char? CheckNullChar(IntPtr L, int stackPos)
		{
			return null;
		}

		public int? CheckNullInt32(IntPtr L, int stackPos)
		{
			return null;
		}

		public uint? CheckNullUInt32(IntPtr L, int stackPos)
		{
			return null;
		}

		public decimal? CheckNullDecimal(IntPtr L, int stackPos)
		{
			return null;
		}

		public float? CheckNullFloat(IntPtr L, int stackPos)
		{
			return null;
		}

		public double? CheckNullNumber(IntPtr L, int stackPos)
		{
			return null;
		}

		public bool? CheckNullBool(IntPtr L, int stackPos)
		{
			return null;
		}

		public long? CheckNullInt64(IntPtr L, int stackPos)
		{
			return null;
		}

		public ulong? CheckNullUInt64(IntPtr L, int stackPos)
		{
			return null;
		}

		public sbyte[] CheckSByteArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public short[] CheckInt16Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public ushort[] CheckUInt16Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public decimal[] CheckDecimalArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public float[] CheckFloatArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public double[] CheckDoubleArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public int[] CheckInt32Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public uint[] CheckUInt32Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public long[] CheckInt64Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public ulong[] CheckUInt64Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector3? CheckNullVec3(IntPtr L, int stackPos)
		{
			return null;
		}

		public Quaternion? CheckNullQuat(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector2? CheckNullVec2(IntPtr L, int stackPos)
		{
			return null;
		}

		public Color? CheckNullColor(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector4? CheckNullVec4(IntPtr L, int stackPos)
		{
			return null;
		}

		public Ray? CheckNullRay(IntPtr L, int stackPos)
		{
			return null;
		}

		public Bounds? CheckNullBounds(IntPtr L, int stackPos)
		{
			return null;
		}

		public LayerMask? CheckNullLayerMask(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector3[] CheckVec3Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public Quaternion[] CheckQuatArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector2[] CheckVec2Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public Color[] CheckColorArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public Vector4[] CheckVec4Array(IntPtr L, int stackPos)
		{
			return null;
		}

		public Type[] CheckTypeArray(IntPtr L, int stackPos)
		{
			return null;
		}

		public void Push(IntPtr L, sbyte? n)
		{
		}

		public void Push(IntPtr L, byte? n)
		{
		}

		public void Push(IntPtr L, short? n)
		{
		}

		public void Push(IntPtr L, ushort? n)
		{
		}

		public void Push(IntPtr L, char? n)
		{
		}

		public void Push(IntPtr L, int? n)
		{
		}

		public void Push(IntPtr L, uint? n)
		{
		}

		public void Push(IntPtr L, decimal? n)
		{
		}

		public void Push(IntPtr L, float? n)
		{
		}

		public void Push(IntPtr L, double? n)
		{
		}

		public void Push(IntPtr L, bool? n)
		{
		}

		public void Push(IntPtr L, long? n)
		{
		}

		public void Push(IntPtr L, ulong? n)
		{
		}

		public void Push(IntPtr L, Vector3? v3)
		{
		}

		public void Push(IntPtr L, Quaternion? n)
		{
		}

		public void Push(IntPtr L, Vector2? n)
		{
		}

		public void Push(IntPtr L, Color? n)
		{
		}

		public void Push(IntPtr L, Vector4? n)
		{
		}

		public void Push(IntPtr L, Ray? n)
		{
		}

		public void Push(IntPtr L, Bounds? n)
		{
		}

		public void Push(IntPtr L, LayerMask? n)
		{
		}

		public void Push(IntPtr L, Touch? n)
		{
		}

		public void Push(IntPtr L, RaycastHit? n)
		{
		}
	}
}
