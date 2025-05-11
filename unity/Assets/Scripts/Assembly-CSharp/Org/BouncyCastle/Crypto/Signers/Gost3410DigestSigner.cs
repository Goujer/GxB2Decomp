namespace Org.BouncyCastle.Crypto.Signers
{
	public class Gost3410DigestSigner : ISigner
	{
		private readonly IDigest digest;

		private readonly IDsa dsaSigner;

		private bool forSigning;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public Gost3410DigestSigner(IDsa signer, IDigest digest)
		{
		}

		public virtual void Init(bool forSigning, ICipherParameters parameters)
		{
		}

		public virtual void Update(byte input)
		{
		}

		public virtual void BlockUpdate(byte[] input, int inOff, int length)
		{
		}

		public virtual byte[] GenerateSignature()
		{
			return null;
		}

		public virtual bool VerifySignature(byte[] signature)
		{
			return false;
		}

		public virtual void Reset()
		{
		}
	}
}
