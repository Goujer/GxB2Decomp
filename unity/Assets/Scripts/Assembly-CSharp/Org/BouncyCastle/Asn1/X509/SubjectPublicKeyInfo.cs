namespace Org.BouncyCastle.Asn1.X509
{
	public class SubjectPublicKeyInfo : Asn1Encodable
	{
		private readonly AlgorithmIdentifier algID;

		private readonly DerBitString keyData;

		public AlgorithmIdentifier AlgorithmID
		{
			get
			{
				return null;
			}
		}

		public DerBitString PublicKeyData
		{
			get
			{
				return null;
			}
		}

		public SubjectPublicKeyInfo(AlgorithmIdentifier algID, Asn1Encodable publicKey)
		{
		}

		public SubjectPublicKeyInfo(AlgorithmIdentifier algID, byte[] publicKey)
		{
		}

		private SubjectPublicKeyInfo(Asn1Sequence seq)
		{
		}

		public static SubjectPublicKeyInfo GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static SubjectPublicKeyInfo GetInstance(object obj)
		{
			return null;
		}

		public Asn1Object GetPublicKey()
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
