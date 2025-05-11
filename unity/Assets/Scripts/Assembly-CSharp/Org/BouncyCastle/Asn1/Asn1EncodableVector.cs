using System;
using System.Collections;

namespace Org.BouncyCastle.Asn1
{
	public class Asn1EncodableVector : IEnumerable
	{
		private IList v;

		public Asn1Encodable Item
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

		public int Count
		{
			get
			{
				return 0;
			}
		}

		public Asn1EncodableVector(params Asn1Encodable[] v)
		{
		}

		public static Asn1EncodableVector FromEnumerable(IEnumerable e)
		{
			return null;
		}

		public void Add(params Asn1Encodable[] objs)
		{
		}

		public void AddOptional(params Asn1Encodable[] objs)
		{
		}

		[Obsolete]
		public Asn1Encodable Get(int index)
		{
			return null;
		}

		public IEnumerator GetEnumerator()
		{
			return null;
		}
	}
}
