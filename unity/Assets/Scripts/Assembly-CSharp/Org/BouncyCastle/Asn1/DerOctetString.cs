namespace Org.BouncyCastle.Asn1
{
	public class DerOctetString : Asn1OctetString
	{
		public DerOctetString(byte[] str)
			: base((byte[])null)
		{
		}

		public DerOctetString(Asn1Encodable obj)
			: base((byte[])null)
		{
		}

		internal override void Encode(DerOutputStream derOut)
		{
		}

		internal static void Encode(DerOutputStream derOut, byte[] bytes, int offset, int length)
		{
		}
	}
}
