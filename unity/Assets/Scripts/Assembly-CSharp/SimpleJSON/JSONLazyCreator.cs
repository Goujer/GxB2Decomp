using System.IO;
using System.Text;

namespace SimpleJSON
{
	internal class JSONLazyCreator : JSONNode
	{
		private JSONNode m_Node;

		private string m_Key;

		public override JSONNodeType Tag
		{
			get
			{
				return default(JSONNodeType);
			}
		}

		public override JSONNode Item
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public override JSONNode Item
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public override int AsInt
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public override float AsFloat
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public override double AsDouble
		{
			get
			{
				return 0.0;
			}
			set
			{
			}
		}

		public override long AsLong
		{
			get
			{
				return 0L;
			}
			set
			{
			}
		}

		public override bool AsBool
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public override JSONArray AsArray
		{
			get
			{
				return null;
			}
		}

		public override JSONObject AsObject
		{
			get
			{
				return null;
			}
		}

		public JSONLazyCreator(JSONNode aNode)
		{
		}

		public JSONLazyCreator(JSONNode aNode, string aKey)
		{
		}

		public override Enumerator GetEnumerator()
		{
			return default(Enumerator);
		}

		private T Set<T>(T aVal) where T : JSONNode
		{
			return null;
		}

		public override void Add(JSONNode aItem)
		{
		}

		public override void Add(string aKey, JSONNode aItem)
		{
		}

		public static bool operator ==(JSONLazyCreator a, object b)
		{
			return false;
		}

		public static bool operator !=(JSONLazyCreator a, object b)
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

		internal override void WriteToStringBuilder(StringBuilder aSB, int aIndent, int aIndentInc, JSONTextMode aMode)
		{
		}

		public override void SerializeBinary(BinaryWriter aWriter)
		{
		}
	}
}
