using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Crypto.Signers
{
	public class DsaDigestSigner : ISigner
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

		public DsaDigestSigner(IDsa signer, IDigest digest)
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

		private byte[] DerEncode(BigInteger r, BigInteger s)
		{
			return null;
		}

		private BigInteger[] DerDecode(byte[] encoding)
		{
			return null;
		}
	}
}
