namespace Org.BouncyCastle.Asn1.X9
{
	public class DHValidationParms : Asn1Encodable
	{
		private readonly DerBitString seed;

		private readonly DerInteger pgenCounter;

		public DerBitString Seed
		{
			get
			{
				return null;
			}
		}

		public DerInteger PgenCounter
		{
			get
			{
				return null;
			}
		}

		public DHValidationParms(DerBitString seed, DerInteger pgenCounter)
		{
		}

		private DHValidationParms(Asn1Sequence seq)
		{
		}

		public static DHValidationParms GetInstance(Asn1TaggedObject obj, bool isExplicit)
		{
			return null;
		}

		public static DHValidationParms GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
