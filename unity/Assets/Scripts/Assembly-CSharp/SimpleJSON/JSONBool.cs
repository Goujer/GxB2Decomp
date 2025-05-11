using System.IO;
using System.Text;

namespace SimpleJSON
{
	public class JSONBool : JSONNode
	{
		private bool m_Data;

		public override JSONNodeType Tag
		{
			get
			{
				return default(JSONNodeType);
			}
		}

		public override bool IsBoolean
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

		public JSONBool(bool aData)
		{
		}

		public JSONBool(string aData)
		{
		}

		public override Enumerator GetEnumerator()
		{
			return default(Enumerator);
		}

		internal override void WriteToStringBuilder(StringBuilder aSB, int aIndent, int aIndentInc, JSONTextMode aMode)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}

		public override void SerializeBinary(BinaryWriter aWriter)
		{
		}
	}
}
