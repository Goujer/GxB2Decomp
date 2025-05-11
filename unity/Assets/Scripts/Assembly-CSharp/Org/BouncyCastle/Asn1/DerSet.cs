namespace Org.BouncyCastle.Asn1
{
	public class DerSet : Asn1Set
	{
		public static readonly DerSet Empty;

		public DerSet()
			: base(0)
		{
		}

		public DerSet(Asn1Encodable obj)
			: base(0)
		{
		}

		public DerSet(params Asn1Encodable[] v)
			: base(0)
		{
		}

		public DerSet(Asn1EncodableVector v)
			: base(0)
		{
		}

		internal DerSet(Asn1EncodableVector v, bool needsSorting)
			: base(0)
		{
		}

		public static DerSet FromVector(Asn1EncodableVector v)
		{
			return null;
		}

		internal static DerSet FromVector(Asn1EncodableVector v, bool needsSorting)
		{
			return null;
		}

		internal override void Encode(DerOutputStream derOut)
		{
		}
	}
}
