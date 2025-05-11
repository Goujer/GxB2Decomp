using System.Collections.Generic;
using System.IO;
using System.Text;

namespace SimpleJSON
{
	public class JSONObject : JSONNode
	{
		private Dictionary<string, JSONNode> m_Dict;

		private bool inline;

		public override bool Inline
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public override JSONNodeType Tag
		{
			get
			{
				return default(JSONNodeType);
			}
		}

		public override bool IsObject
		{
			get
			{
				return false;
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

		public override int Count
		{
			get
			{
				return 0;
			}
		}

		public override IEnumerable<JSONNode> Children
		{
			get
			{
				return null;
			}
		}

		public override Enumerator GetEnumerator()
		{
			return default(Enumerator);
		}

		public override void Add(string aKey, JSONNode aItem)
		{
		}

		public override JSONNode Remove(string aKey)
		{
			return null;
		}

		public override JSONNode Remove(int aIndex)
		{
			return null;
		}

		public override JSONNode Remove(JSONNode aNode)
		{
			return null;
		}

		internal override void WriteToStringBuilder(StringBuilder aSB, int aIndent, int aIndentInc, JSONTextMode aMode)
		{
		}

		public override void SerializeBinary(BinaryWriter aWriter)
		{
		}
	}
}
