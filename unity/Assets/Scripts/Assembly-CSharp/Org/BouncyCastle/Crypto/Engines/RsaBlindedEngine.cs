using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Engines
{
	public class RsaBlindedEngine : IAsymmetricBlockCipher
	{
		private readonly RsaCoreEngine core;

		private RsaKeyParameters key;

		private SecureRandom random;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public virtual void Init(bool forEncryption, ICipherParameters param)
		{
		}

		public virtual int GetInputBlockSize()
		{
			return 0;
		}

		public virtual int GetOutputBlockSize()
		{
			return 0;
		}

		public virtual byte[] ProcessBlock(byte[] inBuf, int inOff, int inLen)
		{
			return null;
		}
	}
}
