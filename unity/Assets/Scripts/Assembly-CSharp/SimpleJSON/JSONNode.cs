using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

namespace SimpleJSON
{
	public abstract class JSONNode
	{
		public struct Enumerator
		{
			private enum Type
			{
				None = 0,
				Array = 1,
				Object = 2
			}

			private Type type;

			private Dictionary<string, JSONNode>.Enumerator m_Object;

			private List<JSONNode>.Enumerator m_Array;

			public bool IsValid
			{
				get
				{
					return false;
				}
			}

			public KeyValuePair<string, JSONNode> Current
			{
				get
				{
					return default(KeyValuePair<string, JSONNode>);
				}
			}

			public Enumerator(List<JSONNode>.Enumerator aArrayEnum)
			{
				type = default(Type);
				m_Object = default(Dictionary<string, JSONNode>.Enumerator);
				m_Array = default(List<JSONNode>.Enumerator);
			}

			public Enumerator(Dictionary<string, JSONNode>.Enumerator aDictEnum)
			{
				type = default(Type);
				m_Object = default(Dictionary<string, JSONNode>.Enumerator);
				m_Array = default(List<JSONNode>.Enumerator);
			}

			public bool MoveNext()
			{
				return false;
			}
		}

		public struct ValueEnumerator
		{
			private Enumerator m_Enumerator;

			public JSONNode Current
			{
				get
				{
					return null;
				}
			}

			public ValueEnumerator(List<JSONNode>.Enumerator aArrayEnum)
			{
				m_Enumerator = default(Enumerator);
			}

			public ValueEnumerator(Dictionary<string, JSONNode>.Enumerator aDictEnum)
			{
				m_Enumerator = default(Enumerator);
			}

			public ValueEnumerator(Enumerator aEnumerator)
			{
				m_Enumerator = default(Enumerator);
			}

			public bool MoveNext()
			{
				return false;
			}

			public ValueEnumerator GetEnumerator()
			{
				return default(ValueEnumerator);
			}
		}

		public struct KeyEnumerator
		{
			private Enumerator m_Enumerator;

			public string Current
			{
				get
				{
					return null;
				}
			}

			public KeyEnumerator(List<JSONNode>.Enumerator aArrayEnum)
			{
				m_Enumerator = default(Enumerator);
			}

			public KeyEnumerator(Dictionary<string, JSONNode>.Enumerator aDictEnum)
			{
				m_Enumerator = default(Enumerator);
			}

			public KeyEnumerator(Enumerator aEnumerator)
			{
				m_Enumerator = default(Enumerator);
			}

			public bool MoveNext()
			{
				return false;
			}

			public KeyEnumerator GetEnumerator()
			{
				return default(KeyEnumerator);
			}
		}

		public class LinqEnumerator : IEnumerator<KeyValuePair<string, JSONNode>>, IEnumerable<KeyValuePair<string, JSONNode>>, IEnumerator, IDisposable, IEnumerable
		{
			private JSONNode m_Node;

			private Enumerator m_Enumerator;

			object IEnumerator.Current
			{
				get
				{
					return null;
				}
			}

			public KeyValuePair<string, JSONNode> Current
			{
				get
				{
					return default(KeyValuePair<string, JSONNode>);
				}
			}

			internal LinqEnumerator(JSONNode aNode)
			{
			}

			public bool MoveNext()
			{
				return false;
			}

			public void Dispose()
			{
			}

			public IEnumerator<KeyValuePair<string, JSONNode>> GetEnumerator()
			{
				return null;
			}

			public void Reset()
			{
			}

			IEnumerator IEnumerable.GetEnumerator()
			{
				return null;
			}
		}

		public static bool forceASCII;

		public static bool longAsString;

		[ThreadStatic]
		private static StringBuilder m_EscapeBuilder;

		public static JSONContainerType VectorContainerType;

		public static JSONContainerType QuaternionContainerType;

		public static JSONContainerType RectContainerType;

		public abstract JSONNodeType Tag { get; }

		public virtual JSONNode Item
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public virtual JSONNode Item
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public virtual string Value
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public virtual int Count
		{
			get
			{
				return 0;
			}
		}

		public virtual bool IsNumber
		{
			get
			{
				return false;
			}
		}

		public virtual bool IsString
		{
			get
			{
				return false;
			}
		}

		public virtual bool IsBoolean
		{
			get
			{
				return false;
			}
		}

		public virtual bool IsNull
		{
			get
			{
				return false;
			}
		}

		public virtual bool IsArray
		{
			get
			{
				return false;
			}
		}

		public virtual bool IsObject
		{
			get
			{
				return false;
			}
		}

		public virtual bool Inline
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public virtual IEnumerable<JSONNode> Children
		{
			get
			{
				return null;
			}
		}

		public IEnumerable<JSONNode> DeepChildren
		{
			get
			{
				return null;
			}
		}

		public IEnumerable<KeyValuePair<string, JSONNode>> Linq
		{
			get
			{
				return null;
			}
		}

		public KeyEnumerator Keys
		{
			get
			{
				return default(KeyEnumerator);
			}
		}

		public ValueEnumerator Values
		{
			get
			{
				return default(ValueEnumerator);
			}
		}

		public virtual double AsDouble
		{
			get
			{
				return 0.0;
			}
			set
			{
			}
		}

		public virtual int AsInt
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public virtual float AsFloat
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public virtual bool AsBool
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public virtual long AsLong
		{
			get
			{
				return 0L;
			}
			set
			{
			}
		}

		public virtual JSONArray AsArray
		{
			get
			{
				return null;
			}
		}

		public virtual JSONObject AsObject
		{
			get
			{
				return null;
			}
		}

		internal static StringBuilder EscapeBuilder
		{
			get
			{
				return null;
			}
		}

		public virtual void Add(string aKey, JSONNode aItem)
		{
		}

		public virtual void Add(JSONNode aItem)
		{
		}

		public virtual JSONNode Remove(string aKey)
		{
			return null;
		}

		public virtual JSONNode Remove(int aIndex)
		{
			return null;
		}

		public virtual JSONNode Remove(JSONNode aNode)
		{
			return null;
		}

		public override string ToString()
		{
			return null;
		}

		public virtual string ToString(int aIndent)
		{
			return null;
		}

		internal abstract void WriteToStringBuilder(StringBuilder aSB, int aIndent, int aIndentInc, JSONTextMode aMode);

		public abstract Enumerator GetEnumerator();

		public static implicit operator JSONNode(string s)
		{
			return null;
		}

		public static implicit operator string(JSONNode d)
		{
			return null;
		}

		public static implicit operator JSONNode(double n)
		{
			return null;
		}

		public static implicit operator double(JSONNode d)
		{
			return 0.0;
		}

		public static implicit operator JSONNode(float n)
		{
			return null;
		}

		public static implicit operator float(JSONNode d)
		{
			return 0f;
		}

		public static implicit operator JSONNode(int n)
		{
			return null;
		}

		public static implicit operator int(JSONNode d)
		{
			return 0;
		}

		public static implicit operator JSONNode(long n)
		{
			return null;
		}

		public static implicit operator long(JSONNode d)
		{
			return 0L;
		}

		public static implicit operator JSONNode(bool b)
		{
			return null;
		}

		public static implicit operator bool(JSONNode d)
		{
			return false;
		}

		public static implicit operator JSONNode(KeyValuePair<string, JSONNode> aKeyValue)
		{
			return null;
		}

		public static bool operator ==(JSONNode a, object b)
		{
			return false;
		}

		public static bool operator !=(JSONNode a, object b)
		{
			return false;
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}

		internal static string Escape(string aText)
		{
			return null;
		}

		private static JSONNode ParseElement(string token, bool quoted)
		{
			return null;
		}

		public static JSONNode Parse(string aJSON)
		{
			return null;
		}

		public abstract void SerializeBinary(BinaryWriter aWriter);

		public void SaveToBinaryStream(Stream aData)
		{
		}

		public void SaveToCompressedStream(Stream aData)
		{
		}

		public void SaveToCompressedFile(string aFileName)
		{
		}

		public string SaveToCompressedBase64()
		{
			return null;
		}

		public void SaveToBinaryFile(string aFileName)
		{
		}

		public string SaveToBinaryBase64()
		{
			return null;
		}

		public static JSONNode DeserializeBinary(BinaryReader aReader)
		{
			return null;
		}

		public static JSONNode LoadFromCompressedFile(string aFileName)
		{
			return null;
		}

		public static JSONNode LoadFromCompressedStream(Stream aData)
		{
			return null;
		}

		public static JSONNode LoadFromCompressedBase64(string aBase64)
		{
			return null;
		}

		public static JSONNode LoadFromBinaryStream(Stream aData)
		{
			return null;
		}

		public static JSONNode LoadFromBinaryFile(string aFileName)
		{
			return null;
		}

		public static JSONNode LoadFromBinaryBase64(string aBase64)
		{
			return null;
		}

		private static JSONNode GetContainer(JSONContainerType aType)
		{
			return null;
		}

		public static implicit operator JSONNode(Vector2 aVec)
		{
			return null;
		}

		public static implicit operator JSONNode(Vector3 aVec)
		{
			return null;
		}

		public static implicit operator JSONNode(Vector4 aVec)
		{
			return null;
		}

		public static implicit operator JSONNode(Quaternion aRot)
		{
			return null;
		}

		public static implicit operator JSONNode(Rect aRect)
		{
			return null;
		}

		public static implicit operator JSONNode(RectOffset aRect)
		{
			return null;
		}

		public static implicit operator Vector2(JSONNode aNode)
		{
			return default(Vector2);
		}

		public static implicit operator Vector3(JSONNode aNode)
		{
			return default(Vector3);
		}

		public static implicit operator Vector4(JSONNode aNode)
		{
			return default(Vector4);
		}

		public static implicit operator Quaternion(JSONNode aNode)
		{
			return default(Quaternion);
		}

		public static implicit operator Rect(JSONNode aNode)
		{
			return default(Rect);
		}

		public static implicit operator RectOffset(JSONNode aNode)
		{
			return null;
		}

		public Vector2 ReadVector2(Vector2 aDefault)
		{
			return default(Vector2);
		}

		public Vector2 ReadVector2(string aXName, string aYName)
		{
			return default(Vector2);
		}

		public Vector2 ReadVector2()
		{
			return default(Vector2);
		}

		public JSONNode WriteVector2(Vector2 aVec, string aXName = "x", string aYName = "y")
		{
			return null;
		}

		public Vector3 ReadVector3(Vector3 aDefault)
		{
			return default(Vector3);
		}

		public Vector3 ReadVector3(string aXName, string aYName, string aZName)
		{
			return default(Vector3);
		}

		public Vector3 ReadVector3()
		{
			return default(Vector3);
		}

		public JSONNode WriteVector3(Vector3 aVec, string aXName = "x", string aYName = "y", string aZName = "z")
		{
			return null;
		}

		public Vector4 ReadVector4(Vector4 aDefault)
		{
			return default(Vector4);
		}

		public Vector4 ReadVector4()
		{
			return default(Vector4);
		}

		public JSONNode WriteVector4(Vector4 aVec)
		{
			return null;
		}

		public Quaternion ReadQuaternion(Quaternion aDefault)
		{
			return default(Quaternion);
		}

		public Quaternion ReadQuaternion()
		{
			return default(Quaternion);
		}

		public JSONNode WriteQuaternion(Quaternion aRot)
		{
			return null;
		}

		public Rect ReadRect(Rect aDefault)
		{
			return default(Rect);
		}

		public Rect ReadRect()
		{
			return default(Rect);
		}

		public JSONNode WriteRect(Rect aRect)
		{
			return null;
		}

		public RectOffset ReadRectOffset(RectOffset aDefault)
		{
			return null;
		}

		public RectOffset ReadRectOffset()
		{
			return null;
		}

		public JSONNode WriteRectOffset(RectOffset aRect)
		{
			return null;
		}

		public Matrix4x4 ReadMatrix()
		{
			return default(Matrix4x4);
		}

		public JSONNode WriteMatrix(Matrix4x4 aMatrix)
		{
			return null;
		}
	}
}
