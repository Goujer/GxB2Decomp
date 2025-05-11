using Org.BouncyCastle.Crypto.Modes;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Engines
{
	public class RC2WrapEngine : IWrapper
	{
		private CbcBlockCipher engine;

		private ICipherParameters parameters;

		private ParametersWithIV paramPlusIV;

		private byte[] iv;

		private bool forWrapping;

		private SecureRandom sr;

		private static readonly byte[] IV2;

		private IDigest sha1;

		private byte[] digest;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public virtual void Init(bool forWrapping, ICipherParameters parameters)
		{
		}

		public virtual byte[] Wrap(byte[] input, int inOff, int length)
		{
			return null;
		}

		public virtual byte[] Unwrap(byte[] input, int inOff, int length)
		{
			return null;
		}

		private byte[] CalculateCmsKeyChecksum(byte[] key)
		{
			return null;
		}

		private bool CheckCmsKeyChecksum(byte[] key, byte[] checksum)
		{
			return false;
		}
	}
}
