using Org.BouncyCastle.Utilities;

namespace Org.BouncyCastle.Crypto.Macs
{
	public class HMac : IMac
	{
		private const byte IPAD = 54;

		private const byte OPAD = 92;

		private readonly IDigest digest;

		private readonly int digestSize;

		private readonly int blockLength;

		private IMemoable ipadState;

		private IMemoable opadState;

		private readonly byte[] inputPad;

		private readonly byte[] outputBuf;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public HMac(IDigest digest)
		{
		}

		public virtual IDigest GetUnderlyingDigest()
		{
			return null;
		}

		public virtual void Init(ICipherParameters parameters)
		{
		}

		public virtual int GetMacSize()
		{
			return 0;
		}

		public virtual void Update(byte input)
		{
		}

		public virtual void BlockUpdate(byte[] input, int inOff, int len)
		{
		}

		public virtual int DoFinal(byte[] output, int outOff)
		{
			return 0;
		}

		public virtual void Reset()
		{
		}

		private static void XorPad(byte[] pad, int len, byte n)
		{
		}
	}
}
