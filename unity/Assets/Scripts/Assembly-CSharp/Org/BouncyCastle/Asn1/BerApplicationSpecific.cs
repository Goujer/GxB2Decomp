namespace Org.BouncyCastle.Asn1
{
	public class BerApplicationSpecific : DerApplicationSpecific
	{
		public BerApplicationSpecific(int tagNo, Asn1EncodableVector vec)
			: base(false, 0, (byte[])null)
		{
		}
	}
}
