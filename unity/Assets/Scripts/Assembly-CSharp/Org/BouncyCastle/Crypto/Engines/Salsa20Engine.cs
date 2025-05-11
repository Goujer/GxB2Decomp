using System;

namespace Org.BouncyCastle.Crypto.Engines
{
	public class Salsa20Engine : IStreamCipher
	{
		public static readonly int DEFAULT_ROUNDS;

		private const int StateSize = 16;

		private static readonly uint[] TAU_SIGMA;

		[Obsolete]
		protected static readonly byte[] sigma;

		[Obsolete]
		protected static readonly byte[] tau;

		protected int rounds;

		private int index;

		internal uint[] engineState;

		internal uint[] x;

		private byte[] keyStream;

		private bool initialised;

		private uint cW0;

		private uint cW1;

		private uint cW2;

		protected virtual int NonceSize
		{
			get
			{
				return 0;
			}
		}

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public Salsa20Engine()
		{
		}

		public Salsa20Engine(int rounds)
		{
		}

		internal void PackTauOrSigma(int keyLength, uint[] state, int stateOffset)
		{
		}

		public virtual void Init(bool forEncryption, ICipherParameters parameters)
		{
		}

		public virtual byte ReturnByte(byte input)
		{
			return 0;
		}

		protected virtual void AdvanceCounter()
		{
		}

		public virtual void ProcessBytes(byte[] inBytes, int inOff, int len, byte[] outBytes, int outOff)
		{
		}

		public virtual void Reset()
		{
		}

		protected virtual void ResetCounter()
		{
		}

		protected virtual void SetKey(byte[] keyBytes, byte[] ivBytes)
		{
		}

		protected virtual void GenerateKeyStream(byte[] output)
		{
		}

		internal static void SalsaCore(int rounds, uint[] input, uint[] x)
		{
		}

		internal static uint R(uint x, int y)
		{
			return 0u;
		}

		private void ResetLimitCounter()
		{
		}

		private bool LimitExceeded()
		{
			return false;
		}

		private bool LimitExceeded(uint len)
		{
			return false;
		}
	}
}
