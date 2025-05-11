namespace Org.BouncyCastle.Asn1.CryptoPro
{
	public class Gost3410PublicKeyAlgParameters : Asn1Encodable
	{
		private DerObjectIdentifier publicKeyParamSet;

		private DerObjectIdentifier digestParamSet;

		private DerObjectIdentifier encryptionParamSet;

		public DerObjectIdentifier PublicKeyParamSet
		{
			get
			{
				return null;
			}
		}

		public DerObjectIdentifier DigestParamSet
		{
			get
			{
				return null;
			}
		}

		public DerObjectIdentifier EncryptionParamSet
		{
			get
			{
				return null;
			}
		}

		public Gost3410PublicKeyAlgParameters(DerObjectIdentifier publicKeyParamSet, DerObjectIdentifier digestParamSet)
		{
		}

		public Gost3410PublicKeyAlgParameters(DerObjectIdentifier publicKeyParamSet, DerObjectIdentifier digestParamSet, DerObjectIdentifier encryptionParamSet)
		{
		}

		public Gost3410PublicKeyAlgParameters(Asn1Sequence seq)
		{
		}

		public static Gost3410PublicKeyAlgParameters GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static Gost3410PublicKeyAlgParameters GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
