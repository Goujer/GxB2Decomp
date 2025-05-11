namespace Org.BouncyCastle.Asn1
{
	public class BerSet : DerSet
	{
		public new static readonly BerSet Empty;

		public BerSet()
		{
		}

		public BerSet(Asn1Encodable obj)
		{
		}

		public BerSet(Asn1EncodableVector v)
		{
		}

		internal BerSet(Asn1EncodableVector v, bool needsSorting)
		{
		}

		public new static BerSet FromVector(Asn1EncodableVector v)
		{
			return null;
		}

		internal new static BerSet FromVector(Asn1EncodableVector v, bool needsSorting)
		{
			return null;
		}

		internal override void Encode(DerOutputStream derOut)
		{
		}
	}
}
