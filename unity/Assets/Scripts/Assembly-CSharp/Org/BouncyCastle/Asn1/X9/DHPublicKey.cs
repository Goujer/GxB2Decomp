namespace Org.BouncyCastle.Asn1.X9
{
	public class DHPublicKey : Asn1Encodable
	{
		private readonly DerInteger y;

		public DerInteger Y
		{
			get
			{
				return null;
			}
		}

		public DHPublicKey(DerInteger y)
		{
		}

		public static DHPublicKey GetInstance(Asn1TaggedObject obj, bool isExplicit)
		{
			return null;
		}

		public static DHPublicKey GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
