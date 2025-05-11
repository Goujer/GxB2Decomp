namespace Org.BouncyCastle.Asn1
{
	public class BerSequence : DerSequence
	{
		public new static readonly BerSequence Empty;

		public BerSequence()
		{
		}

		public BerSequence(Asn1Encodable obj)
		{
		}

		public BerSequence(params Asn1Encodable[] v)
		{
		}

		public BerSequence(Asn1EncodableVector v)
		{
		}

		public new static BerSequence FromVector(Asn1EncodableVector v)
		{
			return null;
		}

		internal override void Encode(DerOutputStream derOut)
		{
		}
	}
}
