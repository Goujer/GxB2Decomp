using System;
using System.Collections;

namespace Org.BouncyCastle.Asn1
{
	public abstract class Asn1Set : Asn1Object, IEnumerable
	{
		private class Asn1SetParserImpl : Asn1SetParser, IAsn1Convertible
		{
			private readonly Asn1Set outer;

			private readonly int max;

			private int index;

			public Asn1SetParserImpl(Asn1Set outer)
			{
			}

			public IAsn1Convertible ReadObject()
			{
				return null;
			}

			public virtual Asn1Object ToAsn1Object()
			{
				return null;
			}
		}

		private class DerComparer : IComparer
		{
			public int Compare(object x, object y)
			{
				return 0;
			}

			private bool AllZeroesFrom(byte[] bs, int pos)
			{
				return false;
			}
		}

		private readonly IList _set;

		public virtual Asn1Encodable Item
		{
			get
			{
				return null;
			}
		}

		[Obsolete]
		public int Size
		{
			get
			{
				return 0;
			}
		}

		public virtual int Count
		{
			get
			{
				return 0;
			}
		}

		public Asn1SetParser Parser
		{
			get
			{
				return null;
			}
		}

		protected internal Asn1Set(int capacity)
		{
		}

		public static Asn1Set GetInstance(object obj)
		{
			return null;
		}

		public static Asn1Set GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public virtual IEnumerator GetEnumerator()
		{
			return null;
		}

		[Obsolete]
		public IEnumerator GetObjects()
		{
			return null;
		}

		[Obsolete]
		public Asn1Encodable GetObjectAt(int index)
		{
			return null;
		}

		public virtual Asn1Encodable[] ToArray()
		{
			return null;
		}

		protected override int Asn1GetHashCode()
		{
			return 0;
		}

		protected override bool Asn1Equals(Asn1Object asn1Object)
		{
			return false;
		}

		private Asn1Encodable GetCurrent(IEnumerator e)
		{
			return null;
		}

		protected internal void Sort()
		{
		}

		protected internal void AddObject(Asn1Encodable obj)
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
