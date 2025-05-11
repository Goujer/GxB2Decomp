using System.IO;
using System.Text;

namespace SimpleJSON
{
	public class JSONNull : JSONNode
	{
		private static JSONNull m_StaticInstance;

		public static bool reuseSameInstance;

		public override JSONNodeType Tag
		{
			get
			{
				return default(JSONNodeType);
			}
		}

		public override bool IsNull
		{
			get
			{
				return false;
			}
		}

		public override string Value
		{
			get
			{
				return null;
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

		private JSONNull()
		{
		}

		public static JSONNull CreateOrGet()
		{
			return null;
		}

		public override Enumerator GetEnumerator()
		{
			return default(Enumerator);
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
