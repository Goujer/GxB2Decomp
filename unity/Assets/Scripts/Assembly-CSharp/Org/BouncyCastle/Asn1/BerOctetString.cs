using System;
using System.Collections;

namespace Org.BouncyCastle.Asn1
{
	public class BerOctetString : DerOctetString, IEnumerable
	{
		private const int MaxLength = 1000;

		private readonly IEnumerable octs;

		public BerOctetString(byte[] str)
			: base((byte[])null)
		{
		}

		public BerOctetString(IEnumerable octets)
			: base((byte[])null)
		{
		}

		public BerOctetString(Asn1Object obj)
			: base((byte[])null)
		{
		}

		public BerOctetString(Asn1Encodable obj)
			: base((byte[])null)
		{
		}

		public static BerOctetString FromSequence(Asn1Sequence seq)
		{
			return null;
		}

		private static byte[] ToBytes(IEnumerable octs)
		{
			return null;
		}

		public override byte[] GetOctets()
		{
			return null;
		}

		public IEnumerator GetEnumerator()
		{
			return null;
		}

		[Obsolete]
		public IEnumerator GetObjects()
		{
			return null;
		}

		private IList GenerateOcts()
		{
			return null;
		}

		internal override void Encode(DerOutputStream derOut)
		{
		}
	}
}
